# Gym Forza — Flutter

Aplicación móvil de socios de Gym Forza, migración del cliente Android original desarrollado en Kotlin y Jetpack Compose.

## Identidad Android
- Application ID / namespace: `com.gymforza.app`
- Min SDK: 24 (Android 7.0 o superior)

Se conserva el identificador de paquete de la app original. Para publicar una actualización sobre instalaciones existentes también será necesario firmar con el mismo keystore original.

## Servicios
- Backend de producción: `https://gymforza.onrender.com/`
- Autenticación: Supabase Auth
- La app cliente debe usar únicamente la clave publishable de Supabase. Nunca incluir una service_role key.

## Configuración local
Las credenciales se inyectarán al compilar mediante `--dart-define` y no deben guardarse en el repositorio:

```powershell
flutter build apk --release `
  --dart-define=SUPABASE_URL=https://TU-PROYECTO.supabase.co `
  --dart-define=SUPABASE_PUBLISHABLE_KEY=TU_CLAVE_PUBLICA
```

## Funcionalidades a migrar
- Inicio y cierre de sesión y recuperación de contraseña.
- Inicio del socio y consulta de membresía.
- Historial de pagos.
- Perfil y actualización de fotografía.
- Solicitud y visualización de QR temporal de acceso (vigencia de cinco minutos).

La validación del QR corresponde a la aplicación de acceso y al backend, no a esta app de socios.
