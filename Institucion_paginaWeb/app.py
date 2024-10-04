from flask import Flask, render_template, request, redirect, url_for, session, flash
from modelo import UsuarioModel
from modelo import MateriaModel

app = Flask(__name__)
app.secret_key = 'clave_secreta'  # Necesario para gestionar sesiones

# Ruta para el inicio de sesión
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        correo = request.form['correo']
        contrasena = request.form['contrasena']
        
        # Verifica las credenciales
        usuario = UsuarioModel.verificar_usuario(correo, contrasena)
        
        if usuario:  # Si existe el usuario y la contraseña coincide
            session['usuario'] = usuario['usuCorreo']  # Guardamos el correo del usuario en la sesión
            return redirect(url_for('index'))  # Redirige al módulo de usuario
        else:
            flash('Correo o contraseña incorrectos', 'error')  # Mensaje de error si las credenciales no coinciden
            return redirect(url_for('login'))  # Redirige de nuevo al login

    return render_template('login.html')  # Muestra el formulario de inicio de sesión

# Ruta para cerrar sesión
@app.route('/logout', methods=['GET', 'POST'])
def logout():
    session.pop('usuario', None)  # Elimina al usuario de la sesión
    return redirect(url_for('login'))  # Redirige al login

# Ruta para la página principal donde se muestran todos los usuarios
@app.route('/index')
def index():
    if 'usuario' not in session:  # Verifica que haya un usuario autenticado
        return redirect(url_for('login'))  # Si no está autenticado, redirige al login
    
    usuarios = UsuarioModel.obtener_usuarios()  # Obtiene los usuarios desde el modelo
    return render_template('usuarios.html', usuarios=usuarios)  # Renderiza la plantilla con los usuarios

# Ruta para agregar un nuevo usuario
@app.route('/agregar', methods=['POST'])
def agregar_usuario():
    correo = request.form['correo']
    contrasena = request.form['contrasena']
    apellido = request.form['apellido']
    nombre = request.form['nombre']
    tipoDocumento = request.form['tipoDocumento']
    documento = request.form['documento']
    telefono = request.form['telefono']
    estado = request.form['estado']
    rol = request.form['rol']
    UsuarioModel.crear_usuario(correo, contrasena,apellido,nombre,tipoDocumento,documento,telefono,estado,rol)  # Inserta el nuevo usuario en la BD
    return redirect(url_for('index'))  # Redirige a la página principal

# Ruta para actualizar un usuario
@app.route('/actualizar/<int:idusuario>', methods=['POST'])
def actualizar_usuario(idusuario):
    correo = request.form['correo']
    contrasena = request.form['contrasena']
    apellido = request.form['apellido']
    nombre = request.form['nombre']
    tipoDocumento = request.form['tipoDocumento']
    documento = request.form['documento']
    telefono = request.form['telefono']
    estado = request.form['estado']
    rol = request.form['rol']
    UsuarioModel.actualizar_usuario(idusuario, correo, contrasena,apellido,nombre,tipoDocumento,documento,telefono,estado,rol)  # Actualiza el usuario en la BD
    return redirect(url_for('index'))  # Redirige a la página principal

# Ruta para eliminar un usuario
@app.route('/eliminar/<int:idusuario>')
def eliminar_usuario(idusuario):
    UsuarioModel.eliminar_usuario(idusuario)  # Elimina el usuario en la BD
    return redirect(url_for('index'))  # Redirige a la página principal

# Ruta para la página principal donde se muestran todas las materias
@app.route('/materias')
def materias():
    if 'usuario' not in session:  # Verifica que haya un usuario autenticado
        return redirect(url_for('login'))  # Si no está autenticado, redirige al login
    
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

if __name__ == '__main__':
    app.run(debug=True)  # Ejecuta la aplicación Flask con modo de depuración