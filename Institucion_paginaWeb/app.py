from flask import Flask, render_template, request, redirect, url_for, session, flash
from modelo import UsuarioModel, MateriaModel, CursoModel, ProfesorModel, EstudianteModel, AdministrativoModel
from google.oauth2.credentials import Credentials
from google_auth_oauthlib.flow import InstalledAppFlow
from googleapiclient.discovery import build
from google.auth.transport.requests import Request
import os
import datetime


app = Flask(__name__)
app.secret_key = 'clave_secreta'  # Necesario para gestionar sesiones


SCOPES = ['https://www.googleapis.com/auth/calendar']



def login_google_auth():
    creds = None

    if os.path.exists('token.json'):
        creds = Credentials.from_authorized_user_file('token.json', SCOPES)


    if not creds or not creds.valid:
        if creds and creds.expired and creds.refresh_token:
            creds.refresh(Request())
        else:
            flow = InstalledAppFlow.from_client_secrets_file('credentials.json', SCOPES)
            creds = flow.run_local_server(port=0) 


        with open('token.json', 'w') as token:
            token.write(creds.to_json())

    return creds

# Ruta para la página principal donde se muestran todos los usuarios
@app.route('/index')
def index():
    if 'usuario' not in session:
        return redirect(url_for('login'))
    usuarios = UsuarioModel.obtener_usuarios()
    return render_template('usuarios.html', usuarios=usuarios)

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
    if 'usuario' not in session:
        return redirect(url_for('login'))    
    materias = MateriaModel.obtener_materias()  # Obtiene las materias desde el modelo
    profesores = MateriaModel.obtener_profesores()  # Obtiene los profesores
    return render_template('materias.html', materias=materias, profesores=profesores)  # Pasa ambas listas al HTML


def get_google_calendar_service():
    creds = None
    if os.path.exists('token.json'):
        creds = Credentials.from_authorized_user_file('token.json', SCOPES)
    
    if not creds or not creds.valid:
        if creds and creds.expired and creds.refresh_token:
            creds.refresh(Request())
        else:
            flow = InstalledAppFlow.from_client_secrets_file('credentials.json', SCOPES)
            creds = flow.run_local_server(port=0)
        
        with open('token.json', 'w') as token:
            token.write(creds.to_json())
    
    service = build('calendar', 'v3', credentials=creds)
    return service

def agregar_evento_calendario(materia, fecha_inicio, fecha_fin):
    service = get_google_calendar_service()

    evento = {
        'summary': materia,
        'start': {'dateTime': fecha_inicio.isoformat(), 'timeZone': 'America/Bogota'},
        'end': {'dateTime': fecha_fin.isoformat(), 'timeZone': 'America/Bogota'}
    }

    event = service.events().insert(calendarId='primary', body=evento).execute()
    print(f'Evento creado: {event.get("htmlLink")}')


# Ruta para agregar una nueva materia
@app.route('/agregar_materia', methods=['POST'])
def agregar_materia():
    descripcion = request.form['descripcion']
    profesor = request.form['profesor']
    estado = request.form['estado']
    fecha_inicio = datetime.datetime.now() # toca verificar inicio de las clases, en este se llamo como ejemplo la fecha actual
    fecha_fin = fecha_inicio + datetime.timedelta(hours=2) 

    MateriaModel.crear_materia(descripcion, profesor, estado)  # Inserta la nueva materia en la BD
    agregar_evento_calendario(descripcion, fecha_inicio, fecha_fin)#(descripcion, fecha_inicio, fecha_fin)
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
    profesores = CursoModel.obtener_profesores()  # Obtiene los profesores desde el modelo
    return render_template('cursos.html', cursos=cursos, profesores=profesores)  # Pasa ambas listas al HTML

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
    cursos = CursoModel.obtener_cursos()  # Obtiene los cursos desde el modelo
    return render_template('estudiantes.html', estudiantes=estudiantes, cursos=cursos)  # Pasa ambas listas al HTML

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
