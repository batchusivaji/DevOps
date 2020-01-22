# Packer

 * Packer is an open source tool for creating identical machine images for multiple platforms from a single source configuration. Packer is lightweight, runs on every major operating system, and is highly performant, creating machine images for multiple platforms in parallel. Packer does not replace configuration management like Chef or Puppet. In fact, when building images, Packer is able to use tools like Chef or Puppet to install software onto the image.

 * Every Virtualization Platform needs an Image to Create Virtual MachineBy using packer template we can create images for the irrespective of the virtulaization platform.

# Packer Template
 
  In packer template we have 4 modules
   1. Variables
   2. Builders
   3. Provisioners
   4. Post-processors

 1. Variables : Variables are make packer template generic which increases reuability. If you create a packer template by using variables this template can be use anyone and run anywhere. If you don't used any variables in packer template you hardcoded the template means it works on particular regeion or paritular image.

    EX: Regeion, Acesskey, Secretkey, Imageid

# Variables types
    
  variables are two types.
    1. User Variables
    2. Environment Variables

  1. User Variables : In order to set a user variable, you must define it either within the variables section within your template, or using the command-line -var or -var-file flags. User variables are used by calling the {{user}} function in the form of {{user `variable`}}. This function can be used in any value but type within the template: in builders, provisioners, anywhere outside the variables section. User variables are available globally within the rest of the template.
      ```
      {{user `variable`}}
      ```

      ```
       "aws-access_key" : "",
       "access_key" : "{{user `aws-access_key`}}"
      ```

  2. Environment Variables : Environment variables can be used within your template using user variables. The env function is available only within the default value of a user variable, allowing you to default a user variable to an environment variable. An example is shown below:

        ```
         "variables": 
          "my_secret": "{{env `MY_SECRET`}}",
        ```

  This will default "my_secret" to be the value of the "MY_SECRET" environment variable (or an empty string if it does not exist).

    * Why can't I use environment variables elsewhere? User variables are the single source of configurable input to a template. We felt that having environment variables used anywhere in a template would confuse the user about the possible inputs to a template. By allowing environment variables only within default values for user variables, user variables remain as the single source of input to a template that a user can easily discover using packer inspect.
  
 2. Builders : Where you want to create packer image in the Particular virtuvalaization platform/Environment.

    Ex: AWS, AZURE, GCP, VIRTUAL BOX, ALIBABA CLOUD.

    * are components of Packer that are able to create a machine image for a single platform. Builders read in some configuration and use that to run and generate a machine image. A builder is invoked as part of a build in order to create the actual resulting images. Example builders include VirtualBox, VMware, and Amazon EC2. Builders can be created and added to Packer in the form of plugins.

 3. Provisioners : Provisioners install Necessary softwares to run your application.

   EX: provisioners include shell scripts, Chef, Puppet, etc.

   * are components of Packer that install and configure software within a running machine prior to that machine being turned into a static image. They perform the major work of making the image contain useful software. Example provisioners include shell scripts, Chef, Puppet, etc.

  4. shell provisioners
     
     in shell provisioners we have diffrent types
        1. Inline
        2. Script
        3. Scrpits

      ```
          "provisioners" : [
            {
              "type" : "shell",
              "inline" : [
                "sudo apt-get update"
                "sudo apt-get install openjdk-8-jdk"
              ]
              "pause_before" : "10s",
              "timeout": "10s"
            }
          ]
      ```

      ```
          "provisioners" : [
            {
              "type" : "shell",
              "scripts" : "tomcat.sh",
              "pause_before" : "10s",
              "timeout": "10s"
            }
          ]
      ```

      ```
          "provisioners" : [
            {
              "type" : "shell",
              "scripts" : {
                "./tomcat.sh",
                "./tom.sh"
              }
              "pause_before" : "10s",
              "timeout": "10s"
            }
          ]
      ```
    
    ## Ansible Provisioner

    ```
     "provisioners" : [
       {
         "type" : "ansible",
         "playbook_file": "./playbook.yml"
       }
     ]
    ```


  4. Post-processors are components of Packer that take the result of a builder or another post-processor and process that to create a new artifact. Examples of post-processors are compress to compress artifacts, upload to upload artifacts, etc.

  5. Templates : Templates are JSON files which define one or more builds by configuring the various components of Packer. Packer is able to read a template and use that information to create multiple machine images in parallel.

   ## Packer Commands

 ```
 packer validate ./<name.json>
 packer inspect ./<name.json>
 packer build debug ./<name.json>
 packer apply ./<name.json>
 ```