from flask import Flask, render_template, request, redirect, url_for, session, flash
from modelo import UsuarioModel
from modelo import MateriaModel
from modelo import CursoModel
from modelo import ProfesorModel
from modelo import EstudianteModel
from modelo import AdministrativoModel

app = Flask(__name__)
app.secret_key = 'clave_secreta'  # Necesario para gestionar sesiones

# Ruta para la página principal donde se muestran todos los usuarios
@app.route('/index')
def index():
    
    usuarios = UsuarioModel.obtener_usuarios()  # Obtiene los usuarios desde el modelo
    return render_template('usuarios.html', usuarios=usuarios)  # Renderiza la plantilla con los usuarios

# Ruta para agregar un nuevo usuario
@app.route('/agregar', methods=['POST'])
def agregar_usuario():

    documento = request.form['documento']
    correo = request.form['correo']
    apellido = request.form['apellido']
    nombre = request.form['nombre']
    tipoDocumento = request.form['tipoDocumento']
    telefono = request.form['telefono']
    estado = request.form['estado']
    rol = request.form['rol']
    UsuarioModel.crear_usuario(documento,correo,apellido,nombre,tipoDocumento,telefono,estado,rol)  # Inserta el nuevo usuario en la BD
    return redirect(url_for('index'))  # Redirige a la página principal

# Ruta para actualizar un usuario
@app.route('/actualizar/<int:documento>', methods=['POST'])
def actualizar_usuario(documento):

    correo = request.form['correo']
    apellido = request.form['apellido']
    nombre = request.form['nombre']
    tipoDocumento = request.form['tipoDocumento']
    telefono = request.form['telefono']
    estado = request.form['estado']
    rol = request.form['rol']
    UsuarioModel.actualizar_usuario(documento,correo,apellido,nombre,tipoDocumento,telefono,estado,rol)  # Actualiza el usuario en la BD
    return redirect(url_for('index'))  # Redirige a la página principal

# Ruta para eliminar un usuario
@app.route('/eliminar/<int:documento>')
def eliminar_usuario(documento):
    UsuarioModel.eliminar_usuario(documento)  # Elimina el usuario en la BD
    return redirect(url_for('index'))  # Redirige a la página principal

# Ruta para la página principal donde se muestran todas las materias
@app.route('/materias')
def materias():
    
    materias = MateriaModel.obtener_materias()  # Obtiene las materias desde el modelo
    return render_template('materias.html', materias=materias)  # Renderiza la plantilla con las materias

# Ruta para agregar una nueva materia
@app.route('/agregar_materia', methods=['POST'])
def agregar_materia():
    descripcion = request.form['descripcion']
    profesor = request.form['profesor']
    estado = request.form['estado']
    MateriaModel.crear_materia(descripcion, profesor,estado)  # Inserta la nueva materia en la BD
    return redirect(url_for('materias'))  # Redirige a la página principal

# Ruta para actualizar una materia
@app.route('/actualizar_materia/<int:idmateria>', methods=['POST'])
def actualizar_materia(idmateria):
    descripcion = request.form['descripcion']
    profesor = request.form['profesor']
    estado = request.form['estado']
    MateriaModel.actualizar_materia(idmateria, descripcion, profesor, estado)  # Actualiza la materia en la BD
    return redirect(url_for('materias'))  # Redirige a la página principal

# Ruta para eliminar una materia
@app.route('/eliminar_materia/<int:idmateria>')
def eliminar_materia(idmateria):
    MateriaModel.eliminar_materia(idmateria)  # Elimina la materia en la BD
    return redirect(url_for('materias'))  # Redirige a la página principal


# Ruta para la página principal donde se muestran todos los cursos
@app.route('/cursos')
def cursos():
    
    cursos = CursoModel.obtener_cursos()  # Obtiene los cursos desde el modelo
    return render_template('cursos.html', cursos=cursos)  # Renderiza la plantilla con los cursos

# Ruta para agregar un nuevo curso
@app.route('/agregar_curso', methods=['POST'])
def agregar_curso():
    descripcion = request.form['descripcion']   
    estado = request.form['estado']
    profesor = request.form['profesor']
    CursoModel.crear_curso(descripcion,estado, profesor)  # Inserta el nuevo curso en la BD
    return redirect(url_for('cursos'))  # Redirige a la página principal

# Ruta para actualizar un curso
@app.route('/actualizar_curso/<int:idcurso>', methods=['POST'])
def actualizar_curso(idcurso):
    descripcion = request.form['descripcion']
    estado = request.form['estado']
    profesor = request.form['profesor']
    CursoModel.actualizar_curso(idcurso, descripcion, estado, profesor)  # Actualiza el curso en la BD
    return redirect(url_for('cursos'))  # Redirige a la página principal

# Ruta para eliminar un curso
@app.route('/eliminar_curso/<int:idcurso>')
def eliminar_curso(idcurso):
    CursoModel.eliminar_curso(idcurso)  # Elimina el curso en la BD
    return redirect(url_for('cursos'))  # Redirige a la página principal


# Ruta para la página principal donde se muestran todos los profesores
@app.route('/profesores')
def profesores():
    
    profesores = ProfesorModel.obtener_profesor()  # Obtiene los profesores desde el modelo
    return render_template('profesores.html', profesores=profesores)  # Renderiza la plantilla con los profesores

# Ruta para actualizar un profesor
@app.route('/actualizar_profesor/<int:idprofesor>', methods=['POST'])
def actualizar_profesor(idprofesor):
    estudios = request.form['estudios']
    ProfesorModel.actualizar_profesor(idprofesor, estudios)  # Actualiza el profesor en la BD
    return redirect(url_for('profesores'))  # Redirige a la página principal


# Ruta para la página principal donde se muestran todos los estudiantes
@app.route('/estudiantes')
def estudiantes():
    
    estudiantes = EstudianteModel.obtener_estudiante()  # Obtiene los estudiantes desde el modelo
    return render_template('estudiantes.html', estudiantes=estudiantes)  # Renderiza la plantilla con los estudiantes

# Ruta para actualizar un estudiante
@app.route('/actualizar_estudiante/<int:idestudiante>', methods=['POST'])
def actualizar_estudiante(idestudiante):
    curso = request.form['curso']
    EstudianteModel.actualizar_estudiante(idestudiante, curso)  # Actualiza el curso en la BD
    return redirect(url_for('estudiantes'))  # Redirige a la página principal


# Ruta para la página principal donde se muestran todos los administrativos
@app.route('/administrativos')
def administrativos():
    
    administrativos = AdministrativoModel.obtener_administrativo()  # Obtiene los administrativos desde el modelo
    return render_template('administrativos.html', administrativos=administrativos)  # Renderiza la plantilla con los administrativos

# Ruta para actualizar un administrativo
@app.route('/actualizar_administrativo/<int:idadministrativo>', methods=['POST'])
def actualizar_administrativo(idadministrativo):
    cargo = request.form['cargo']
    AdministrativoModel.actualizar_administrativo(idadministrativo, cargo)  # Actualiza el administrativo en la BD
    return redirect(url_for('administrativos'))  # Redirige a la página principal

if __name__ == '__main__':
    app.run(debug=True)  # Ejecuta la aplicación Flask con modo de depuración
