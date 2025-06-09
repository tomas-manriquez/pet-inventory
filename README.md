# pet-inventory
Este es un mini-proyecto para demostrar código de Vue3, Docker y uso de la metodología de trabajo Gitflow.

## Descripcion
Se eligió hacer una vista en Vue de 1 componente á lá todo app. La aplicación permite ingresar y eliminar entradas en una lista de mascotas.

En los branches: main, dev, release/0.1.0 se encuentra el Dockerfile que permite correr este programa con Docker.

Los comandos para crear y ejecutar el contenedor son los siguientes:

```bash
docker build -t pet-inventory .
docker run -p 3000:80
```

El contenedor estará corriendo y se podrá acceder en el URL ```http://localhost:3000/```.

El desarrollo de la aplicación fue dividida en 3 branches, los cuales se ven en ```f1-input-form```, ```f2-inventory-list``` y ```f3-delete-from-list``` respectivamente. Aunque la buena práctica habría sido eliminar el branch ```release/0.1.0``` una vez fusionada con ```main``` y ```dev```, se decidió mantenerla a modo de evidencia de que realmente se usó un branch para publicación.
