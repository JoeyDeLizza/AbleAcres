FROM fedora:36
WORKDIR /home/app

# install dependencies
RUN dnf update -y
RUN sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
RUN sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
RUN dnf group install "C Development Tools and Libraries" -y
RUN dnf install ruby-devel zlib-devel sqlite dos2unix vips ffmpeg  -y
RUN gem install rails

# Create init script
RUN echo '#!/bin/sh' > /init.sh
RUN echo 'cd /home/app' >> /init.sh
RUN echo 'find . -type f -exec dos2unix {} \;' >> /init.sh
RUN echo 'bin/bundle install' >> /init.sh
RUN echo 'bin/rails db:migrate' >> /init.sh
RUN echo './bin/bundle add tailwindcss-rails' >> /init.sh
RUN echo './bin/rails tailwindcss:install' >> /init.sh
RUN chmod 777 /init.sh

#RUN find . -type f -exec dos2unix {} \;
EXPOSE 3000
#RUN bin/bundle install
RUN umask 000
#RUN bin/rake assets:precompile
#RUN bin/rails db:migrate
# launch the web app

#starts server automatically, leave commented while developing
#CMD ["rails", "server", "-b", "0.0.0.0"]