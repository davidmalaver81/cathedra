## 1. Arquitectura propuesta

La arquitectura de Cathedra se define utilizando el estandar C4, cubriendo los niveles 1 (Contexto) y 2 (Contenedores). El nivel de contexto muestra al estudiante como unico actor externo que interactua con el sistema. El nivel de contenedores desglosa el sistema en sus tres componentes principales: el cliente web, el servidor backend y la base de datos, indicando la tecnologia usada en cada capa y el protocolo de comunicacion entre ellas.
## Nivel 1 — Diagrama de contexto

```mermaid
C4Context
    title Sistema Cathedra - Diagrama de Contexto

    Person(estudiante, "Estudiante", "Usuario del sistema")
    System(cathedra, "Sistema Cathedra", "Centraliza informacion de becas y programas academicos")

    Rel(estudiante, cathedra, "Usa", "HTTPS")

    UpdateElementStyle(estudiante, $bgColor="#f0ede0", $borderColor="#333333", $fontColor="#111111")
    UpdateElementStyle(cathedra, $bgColor="#e6e6fa", $borderColor="#3b3b98", $fontColor="#1a1a1a")
```

## Nivel 2 — Diagrama de contenedores

```mermaid
C4Container
    title Sistema Cathedra - Diagrama de Contenedores

    Person(estudiante, "Estudiante", "Navegador web")

    System_Boundary(cathedra, "Sistema Cathedra") {
        Container(cliente, "Cliente web", "HTML, CSS, Bootstrap", "Interfaz de usuario")
        Container(backend, "Servidor backend", "Django", "Logica de negocio y API")
        ContainerDb(db, "Base de datos", "MySQL", "Almacena la informacion")
    }

    Rel(estudiante, cliente, "Usa", "HTTPS")
    Rel(cliente, backend, "Envia peticiones", "HTTP")
    Rel(backend, db, "Lee/escribe", "SQL")

    UpdateElementStyle(estudiante, $bgColor="#f0ede0", $borderColor="#333333", $fontColor="#111111")
    UpdateElementStyle(cliente, $bgColor="#d5f0e0", $borderColor="#2e7d5f", $fontColor="#111111")
    UpdateElementStyle(backend, $bgColor="#f5ddd0", $borderColor="#a0402a", $fontColor="#111111")
    UpdateElementStyle(db, $bgColor="#f7e8c8", $borderColor="#8a6d1f", $fontColor="#111111")
```
*Figura 1. Diagrama de arquitectura C4 (niveles 1 y 2), fuente propia Cathedra.*

## 1.1. Componentes identificados

- Cliente (frontend): interfaz con la que interactua el estudiante desde su navegador web.

- Servidor (backend): procesa las peticiones, aplica la logica de negocio y se comunica con la base de datos.

- Base de datos: almacena la informacion de usuarios, universidades, becas y programas academicos.

## 1.2. Tecnologias planeadas por capa


| Capa | Tecnologia | Funcion principal |
| --- | --- | --- |
| Cliente (frontend) | HTML5, CSS3, Bootstrap | Estructura, estilo y diseno responsivo de la interfaz que usa el estudiante. |
| Servidor (backend) | Django | Procesa peticiones, aplica la logica de negocio (busquedas, validaciones, gestion de usuarios) y se comunica con la base de datos. |
| Base de datos | MySQL | Almacena la informacion de usuarios, universidades, becas y programas academicos. |

## 1.3. Comunicacion entre capas

- Cliente <-> Servidor: protocolo HTTP/HTTPS, garantizando el cifrado de la informacion transmitida.

- Servidor <-> Base de datos: consultas SQL mediante un driver u ORM de Node.js compatible con MySQL (por ejemplo, mysql2 o Sequelize).
