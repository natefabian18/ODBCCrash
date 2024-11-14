FROM node:20

WORKDIR /usr/src/app
RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y curl apt-transport-https
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /usr/share/keyrings/microsoft-prod.gpg
RUN curl https://packages.microsoft.com/config/debian/12/prod.list > /etc/apt/sources.list.d/mssql-release.list
RUN apt-get update
RUN ACCEPT_EULA=Y apt-get install -y msodbcsql17 mssql-tools unixodbc unixodbc-dev
RUN apt-get install gdb -y

COPY ["package.json", "package-lock.json", "./"]

RUN npm install

COPY . .

#CMD ["gdb", "--args", "node", "willCrash.js" ] #Run with interactive terminal for debugging
CMD ["node", "willCrash.js"]