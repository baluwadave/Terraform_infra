             #!/bin/bash
             sudo apt-get update
             sudo apt-get install -y nginx
             sudo systemctl start nginx
             sudo systemctl enable nginx
             echo "This is my nginx server$HOSTNAME" > /var/www/html/.html