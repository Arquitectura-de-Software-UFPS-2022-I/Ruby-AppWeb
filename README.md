# Ruby-AppWeb



[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Descripción Y Contexto

Es una aplicación web de codigo abierto que permita firmar un documento PDF insertando la imagen de la firma manuscrita de una o mas personas. Este README contiene los pasos necesarios para levantar la aplicacion y ponerla a correr.

## Requerimientos 📑

Número | Descripción |
:--: | -- |
1 | Registrarse en la aplicación para poder usarla. |
2 | Registrar una firma, lo que consiste en subir una imagen. Es deseable una funcionalidad inteligente que verifique si la imagen corresponde a una firma. |
3 | Subir un documento PDF y solicitar la firma de usuarios registrados en la plataforma. La solicitud es notificada al correo electrónico y en la aplicación debe existir una sección de solicitudes pendientes por firma y solicitudes firmadas. |
4 | Firmar un documento PDF para el cual se ha solicitado la firma. La aplicación debe permitir visualizar el PDF, insertar la firma y guardarlo. |
5 | Debe quedar el registro histórico de las firmas. |

## Comenzando - Cosas que deberás tener en cuenta 

###Instalar Ruby

Para Windows

[Ruby2.5.3] https://rubyinstaller.org/downloads/

Para Linux 
https://www.ruby-lang.org/es/documentation/installation/#apt

```bash
    sudo apt-get install ruby-full
```

Para Mac OS 

```bash
    $ brew install ruby
```
### Instalar Framework Rails

Para Windows

https://www.tutorialspoint.com/ruby-on-rails/rails-installation.htm

Para Linux 

Nota: Para la instalacion de Ruby y de  Rails en Linux usted necesitará usar  rbenv la cual es una herramienta ligera para la administracion de versiones de Ruby

*Paso 1
Instalar dependencias de Rails 
```bash
    $sudo yum install -y git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel
```
*Paso 2
Instalar rbenv y  configurar las variables de entorno
```bash
    $ git clone git://github.com/sstephenson/rbenv.git .rbenv
```

```bash
    $ echo 'export PATH = "$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
```

```bash
    $ echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
```


```bash
    $ exec $SHELL
```

*Paso 3 
Instalar Ruby ( en este caso la version 2.5.3 ) 
```bash
  $ rbenv install -v 2.5.3
```

*Paso 4
Instalar paquete de gemas 
```bash
  $ gem install bundler
```

*Paso 5  
Instalar Rails ( En este caso la version 5.2.6.2 ) 
```bash
  $ install rails -v 5.2.6.2
```

hacer que el ejecutable de Rails se habilite 
```bash
  $ rbenv rehash
```

*Paso 6
Instalar el Runtime de javascript
```bash
  $ sudo yum -y install epel-release
```

Instalar paquetes de node.js
```bash
  $ sudo yum install nodejs
```

Nota: Si desea leer la documentacion completa del sitio web original lo podrá encontrar en el siguiente enlace https://www.tutorialspoint.com/ruby-on-rails/rails-installation.htm


Para Mac OS 

```bash
    $ brew install ruby
```

### Instalar MySQL

MySQL fué el RDBMS usado para este proyecto

Para Windows

[My SQL para Windows](https://www.sqlshack.com/how-to-install-mysql-database-server-8-0-19-on-windows-10/#:~:text=Download%20and%20install%20MySQL%20database,can%20see%20four%20installation%20options.)

Para Linux 

```bash
  $ sudo apt-get update
```

```bash
  $ sudo apt-get install mysql-shell
```

Para MAC OS 

```bash
  $ brew install mysql
```

## Documento tecnico

https://docs.google.com/document/d/1gh5J3ge8VUcVjXLoE31WBo19xC572rqs/edit?usp=sharing&ouid=103387603831144223796&rtpof=true&sd=true

## Autores ✒️

let work_team = ['Carlos Alejandro Quiñones Martinez', 'Carlos Felipe Gonzales, 'Adrian Diaz','José Eduardo cruces Avendaño','Yeferson Ascanio','Johan Adrián Díaz Leal'];


## Institución Académica 🏛️

**[Programa de Ingeniería de Sistemas]** de la **[Universidad Francisco de Paula Santander]**


