# Desafío IV

Acabas de ingresar en una consultora que brinda asesoría sobre servicios en la nube. Como primer trabajo te encomiendan desarrollar una pequeña PoC (Proof of Concept) para una startup que la empresa tiene como cliente. 

La SRE lider de tu equipo te dice que ya han hecho diversas pruebas para diferentes clientes y que ya desarrollaron un workflow en [Github Actions](https://docs.github.com/es/actions) que utiliza [Terraform Cloud](https://www.terraform.io/cloud) para desplegar la infraestructura en una Virtual Private Cloud (VPC) de Amazon Web Services (AWS) que tienen en una cuenta para laboratorios. Por lo tanto te dice que uses dicho workflow, que se encuentra en [este](https://github.com/facundoalarcon/gha_terraform_cloud_example) repositorio.

Deberás crear un nuevo repositorio para el proyecto, con el workflow respetando los nombres de las carpetas y archivo **./github/workflows/terraform.yml**.

Ademas, tu lider, te dice que este workflow utiliza una API Key, una Organización y un Workspace de Terraform Cloud, por lo que deberás cargarlos como secrets en tu repositorio, con los siguientes nombres **TF_API_TOKEN**, **ORGANIZATION** y **WORKSPACE** respectivamente. Como estos elementos se van rotando cada determinado lapso de tiempo, te pide que los solicites a ella o a tus compañeros de equipo.

Tu primer trabajo como miembro de este team es crear el código de Terraform para desplegar como Infrastructure as Code (IaC) y tener versionada la misma.

Como tu código estará vinculado a Terraform Cloud no vas a poder usar el archivo **.tfvars** que normalmente se utiliza para definir los valores de las variables en Terraform, estas variables se encuentran en dicha plataforma, a la cual no tienes acceso. Pero tu lider, te comenta que puedes acceder a algunas variables de Terraform Cloud utilizando los siguientes nombres:
- **region** = region permitida en AWS
- **instance_type** = tipo de instancia utilizadas para laboratorio
- **vpc1_id** = ID de la VPC del laboratorio
- **internet_gateway_id** = ID del IGW del laboratorio
- **key1** = nombre de la clave pública registrada en amazon para el acceso a la instancia 

Como ya tienes asignada una VPC y un Internet Gateway (IGW), solamente deberías crear la subnet, dar una IP privada a la instancia dentro de la misma y desplegarla por medio de Terraform. La misma deberá tener montado un sitio de pruebas en una Subnet Pública, cargado por medio de un **user-data** de EC2, con un HTML es suficiente, ya que solo es para una PoC. Se solicita acceso por HTTP y SSH.

Como herramienta adicional puedes solicitar un usuario de AWS, con el cual podrás administrar la instancia una vez que la despliegues. La misma deberá tener una etiqueta Owner, donde asignarás el nombre del usuario que te indiquen, de esta forma podrás manipular tu instancia desde la interfaz de AWS. Si no lo haces no podrás interactuar con la misma una vez desplegada.

Ten en cuenta que además de vos hay otros integrantes nuevos en el equipo que también tienen un trabajo similar para otros clientes. Por lo que deberás seleccionar una subnet diferente a las que ya se encuentren creadas. Para no interferir con el trabajo de otros.

Tu lider te pasa un [repositorio](https://github.com/facundoalarcon/computernetworks/tree/main/terraform/single_ec2) con código de Terraform previamente creado en otra PoC que hicieron para un viejo cliente, para que te sirva de ejemplo.

Al final deberás entregar un reporte al cliente dentro del repositorio que creaste, con un esquema de la infraestructura creada y capturas de pantalla de la consola de administración de AWS con todo lo que se creó.

Consideraciones:
- Solicitar por correo el API Token, Organización y Workspace
- Solicitar por correo el usuario IAM de AWS
- El repositorio debe ser privado
- Brindar acceso al repositorio a todos los stakeholders
- Usar las variables definidas en Terraform Cloud
- Antes de desplegar la infraestructura solicitar un review del código por medio de un Pull Request (PR) a los instructores. Una forma de lograr esto creado el branch main o master en el repositorio con el workflow luego, crear un nuevo branch partiendo del anterior y pushear el código con los archivos .tf
- No necesitarás instalar el cliente de Terraform, ya que los comandos para desplegar la infraestructura son administrados por Github Actions y Terraform Cloud
- La región utilizada es US East (N. Virginia)
- En lo posible entregar el reporte en un README.md del repositorio, caso contrario subir un pdf en el mismo
- Una vez creada la infraestructura, apagar la instancia para que no consuma recursos adicionales. No van a poder hacer esto si no usan la etiqueta Owner = nombre-de-usuario

## Links de referencia
- [Automate Terraform with GitHub Actions](https://learn.hashicorp.com/tutorials/terraform/github-actions)
- [Terraform Documentarion - Resource: aws_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)
- [AWS Region and Zones](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html)
- [Git examples](https://github.com/facundoalarcon/computernetworks/blob/main/terraform/challengeIV/github_steps_example.md)