# Apache 2.4 + PHP 5.4.45

## Build ##

```
docker build -t lippep/php54:latest .
```

## Running a container ##

```
docker run -d \
	-p 80:80 \
	-h 'my.domain.com' \
	-v folder-to-www:/var/www/html \
	-v folder-to-vhosts:/etc/apache2/sites-enabled \
	--name any.name.here \
	lippep/php54
```

## Windows users ##

Execute the following command:

```
docker-machine ls
```

If no machine was found, we must create one:

``` 
docker-machine create --driver virtualbox default
```

And add the virtual machine envs to Windows:

```
FOR /f "tokens=*" %i IN ('docker-machine env --shell cmd default') DO %i
```