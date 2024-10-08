import os
import datetime
from google.oauth2.credentials import Credentials
from google_auth_oauthlib.flow import InstalledAppFlow
from google.auth.transport.requests import Request
from googleapiclient.discovery import build

# Alcances de la API de Google Calendar
SCOPES = ["https://www.googleapis.com/auth/calendar"]

class GoogleCalendar:
    def __init__(self):
        self.service = self._authenticate()

    def _authenticate(self):
        creds = None

        # Verifica si el token de acceso ya existe
        if os.path.exists("token.json"):
            creds = Credentials.from_authorized_user_file("token.json", SCOPES)

        # Si no hay credenciales válidas, se solicita al usuario que inicie sesión
        if not creds or not creds.valid:
            if creds and creds.expired and creds.refresh_token:
                creds.refresh(Request())
            else:
                flow = InstalledAppFlow.from_client_secrets_file(
                    "config/client_secret.json", SCOPES
                )
                creds = flow.run_local_server(port=0)

            # Guarda las credenciales para la próxima vez
            with open("token.json", "w") as token:
                token.write(creds.to_json())

        return build("calendar", "v3", credentials=creds)

    def crear_evento(self, correo_profesor, correo_estudiantes, descripcion, fecha_hora_inicio, duracion=1):
        # Configura el evento
        evento = {
            'summary': descripcion,
            'start': {
                'dateTime': fecha_hora_inicio.isoformat(),
                'timeZone': 'America/Bogota',  # Ajusta según tu zona horaria
            },
            'end': {
                'dateTime': (fecha_hora_inicio + datetime.timedelta(hours=duracion)).isoformat(),
                'timeZone': 'America/Bogota',
            },
            'attendees': [{'email': correo_profesor}] + [{'email': correo} for correo in correo_estudiantes],
        }

        # Llama a la API para crear el evento
        evento_creado = self.service.events().insert(calendarId='primary', body=evento).execute()
   
