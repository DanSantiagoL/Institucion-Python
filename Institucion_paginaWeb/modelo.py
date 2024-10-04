# modelo.py
from config import obtener_conexion

class UsuarioModel:

    @staticmethod
    def crear_usuario(correo, contrasena,apellido,nombre,tipoDocumento,documento,telefono,estado,rol):
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        sql = "INSERT INTO usuario (usuCorreo, usuContrasena,usuApellido,usuNombre,usuTipoDocumento,usuDocumento,usuTelefono,usuEstado,rolId_fk) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)"
        cursor.execute(sql, (correo, contrasena,apellido,nombre,tipoDocumento,documento,telefono,estado,rol))
        conexion.commit()
        conexion.close()

    @staticmethod
    def verificar_usuario(correo, contrasena):
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        sql = "SELECT * FROM usuario WHERE usuCorreo = %s AND usuContrasena = %s"
        cursor.execute(sql, (correo, contrasena))
        usuario = cursor.fetchone()  # Obtiene la primera fila que coincide

        if usuario:  # Si se encuentra el usuario
            # Crea un diccionario con los datos del usuario
            keys = ['usuId', 'usuCorreo', 'usuContrasena', 'usuApellido', 'usuNombre', 'usuTipoDocumento', 'usuDocumento', 'usuTelefono', 'usuEstado', 'rolId_fk']
            return dict(zip(keys, usuario))  # Devuelve un diccionario
        else:
            return None  # Devuelve None si no se encuentra el usuario

        conexion.close()

    @staticmethod
    def obtener_usuarios():
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        cursor.execute("SELECT * FROM usuario")
        usuarios = cursor.fetchall()
        conexion.close()
        return usuarios

    @staticmethod
    def actualizar_usuario(idusuario, correo, contrasena,apellido,nombre,tipoDocumento,documento,telefono,estado,rol):
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        sql = "UPDATE usuario SET usuCorreo = %s, usuContrasena = %s, usuApellido = %s, usuNombre = %s, usuTipoDocumento = %s, usuDocumento = %s, usuTelefono = %s, usuEstado = %s, rolId_fk = %s WHERE usuId = %s"
        cursor.execute(sql, (correo, contrasena,apellido,nombre,tipoDocumento,documento,telefono,estado,rol, idusuario))
        conexion.commit()
        conexion.close()

    @staticmethod
    def eliminar_usuario(idusuario):
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        sql = "DELETE FROM usuario WHERE usuId = %s"
        cursor.execute(sql, (idusuario,))
        conexion.commit()
        conexion.close()

class MateriaModel:

    @staticmethod
    def crear_materia(descripcion, profesor,estado):
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        sql = "INSERT INTO materia (matDescripcion, usuIdProfesor,matEstado) VALUES (%s,%s,%s)"
        cursor.execute(sql, (descripcion, profesor,estado))
        conexion.commit()
        conexion.close()


    @staticmethod
    def obtener_materias():
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        cursor.execute("SELECT * FROM materia")
        materias = cursor.fetchall()
        conexion.close()
        return materias

    @staticmethod
    def actualizar_materia(idmateria, descripcion, profesor,estado):
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        sql = "UPDATE materia SET matDescripcion = %s, usuIdProfesor = %s, matEstado = %s WHERE matId = %s"
        cursor.execute(sql, (descripcion, profesor,estado, idmateria))
        conexion.commit()
        conexion.close()

    @staticmethod
    def eliminar_materia(idmateria):
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        sql = "DELETE FROM materia WHERE matId = %s"
        cursor.execute(sql, (idmateria,))
        conexion.commit()
        conexion.close()
