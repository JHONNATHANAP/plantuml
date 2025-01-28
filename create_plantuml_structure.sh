#!/bin/bash

# Crear la estructura de carpetas
echo "Creando la estructura de carpetas..."
mkdir -p plantuml-styles/config
mkdir -p plantuml-styles/themes/architecture
mkdir -p plantuml-styles/themes/uml
mkdir -p plantuml-styles/themes/custom
mkdir -p plantuml-styles/examples

# Crear archivos en config/
echo "Creando archivos en config/..."
cat <<EOF > plantuml-styles/config/colors.puml
' Configuración de colores globales para temas claro y oscuro

' Tema claro
!define LIGHT_BACKGROUND #FFFFFF
!define LIGHT_PRIMARY #1E90FF
!define LIGHT_SECONDARY #FFA500
!define LIGHT_TEXT #333333
!define LIGHT_BORDER #CCCCCC

' Tema oscuro
!define DARK_BACKGROUND #2D2D2D
!define DARK_PRIMARY #61AFEF
!define DARK_SECONDARY #E5C07B
!define DARK_TEXT #EDEDED
!define DARK_BORDER #4F4F4F
EOF

cat <<EOF > plantuml-styles/config/fonts.puml
' Configuración de tamaños y tipos de letra

' Tamaños de fuente
!define FONT_SMALL 10
!define FONT_NORMAL 14
!define FONT_LARGE 18
!define FONT_EXTRA_LARGE 24

' Tipos de letra
!define FONT_DEFAULT "Arial"
!define FONT_MONO "Courier New"
!define FONT_SERIF "Times New Roman"
EOF

cat <<EOF > plantuml-styles/config/styles.puml
' Estilos generales aplicables a todos los diagramas
' Se pueden ajustar para tema claro o oscuro al incluir los colores correspondientes

skinparam backgroundColor LIGHT_BACKGROUND
skinparam defaultTextAlignment center
skinparam FontName FONT_DEFAULT
skinparam FontSize FONT_NORMAL
skinparam RoundCorner 15
skinparam shadowing true
skinparam ArrowColor LIGHT_PRIMARY
skinparam ActorBorderColor LIGHT_SECONDARY
skinparam BoxBorderColor LIGHT_BORDER
EOF

# Crear archivos en themes/architecture/
echo "Creando archivos en themes/architecture/..."
cat <<EOF > plantuml-styles/themes/architecture/generic.puml
' Estilos genéricos para diagramas de arquitectura

!include ../../config/colors.puml
!include ../../config/fonts.puml
!include ../../config/styles.puml

' Personalizaciones específicas
skinparam rectangle {
    BackgroundColor LIGHT_PRIMARY
    BorderColor LIGHT_BORDER
    FontColor LIGHT_TEXT
    FontSize FONT_NORMAL
}
skinparam cloud {
    BackgroundColor LIGHT_SECONDARY
    BorderColor LIGHT_BORDER
    FontColor LIGHT_TEXT
    FontSize FONT_NORMAL
}
EOF

# Crear archivos en themes/uml/
echo "Creando archivos en themes/uml/..."
cat <<EOF > plantuml-styles/themes/uml/class-diagrams.puml
' Estilos para diagramas de clases

!include ../../config/colors.puml
!include ../../config/fonts.puml
!include ../../config/styles.puml

' Personalización de estilos para clases
skinparam class {
    BackgroundColor LIGHT_BACKGROUND
    BorderColor LIGHT_PRIMARY
    FontColor LIGHT_TEXT
    FontSize FONT_NORMAL
}
EOF

cat <<EOF > plantuml-styles/themes/uml/sequence.puml
' Estilos para diagramas de secuencia

!include ../../config/colors.puml
!include ../../config/fonts.puml
!include ../../config/styles.puml

' Personalización de estilos para participantes y mensajes
skinparam participant {
    BackgroundColor LIGHT_SECONDARY
    BorderColor LIGHT_BORDER
    FontColor LIGHT_TEXT
    FontSize FONT_NORMAL
}
skinparam sequenceMessage {
    FontColor LIGHT_TEXT
    FontSize FONT_SMALL
    ArrowColor LIGHT_PRIMARY
}
EOF

cat <<EOF > plantuml-styles/themes/uml/activity.puml
' Estilos para diagramas de actividad

!include ../../config/colors.puml
!include ../../config/fonts.puml
!include ../../config/styles.puml

' Personalización de actividades
skinparam activity {
    BackgroundColor LIGHT_PRIMARY
    BorderColor LIGHT_BORDER
    FontColor LIGHT_TEXT
    FontSize FONT_NORMAL
}
EOF

cat <<EOF > plantuml-styles/themes/uml/use-case.puml
' Estilos para diagramas de casos de uso

!include ../../config/colors.puml
!include ../../config/fonts.puml
!include ../../config/styles.puml

' Personalización de casos de uso
skinparam usecase {
    BackgroundColor LIGHT_SECONDARY
    BorderColor LIGHT_BORDER
    FontColor LIGHT_TEXT
    FontSize FONT_NORMAL
}
EOF

# Crear archivos en themes/custom/
echo "Creando archivos en themes/custom/..."
cat <<EOF > plantuml-styles/themes/custom/my-custom-theme.puml
' Espacio para personalizaciones específicas

!include ../../config/colors.puml
!include ../../config/fonts.puml
!include ../../config/styles.puml

' Ejemplo de personalización
skinparam rectangle {
    BackgroundColor #FFD700
    BorderColor #DAA520
    FontColor #333333
    FontSize FONT_LARGE
}
EOF

# Crear ejemplos en examples/
echo "Creando ejemplos en examples/..."
cat <<EOF > plantuml-styles/examples/architecture-diagram.puml
@startuml
!include ../themes/architecture/generic.puml

rectangle "Load Balancer" as lb
cloud "AWS Cloud" as cloud
rectangle "Web Server" as web
rectangle "Database" as db

lb --> web
web --> db

@enduml
EOF

cat <<EOF > plantuml-styles/examples/class-diagram.puml
@startuml
!include ../themes/uml/class-diagrams.puml

class User {
    + name: String
    + email: String
    + login(): void
}

class Admin {
    + role: String
    + manageUsers(): void
}

User <|-- Admin

@enduml
EOF

cat <<EOF > plantuml-styles/examples/sequence-diagram.puml
@startuml
!include ../themes/uml/sequence.puml

participant "User" as user
participant "System" as system

user -> system: Request data
system --> user: Return data

@enduml
EOF

echo "Estructura de carpetas y archivos creada con éxito."
