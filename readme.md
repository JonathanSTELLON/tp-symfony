# Docker PHP alpine

## 1. build project and up it
```sh
make up
```

## 2. connect you on app container
```sh
make app
```

## 3. git configuration
```sh
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```

## 4. New symfony project
```sh
symfony new project --version=6.0

# move files on project to ./
rm -rf project/var/*
mv project/.env* ./
mv project/.gitignore* ./
mv project/* ./
```

## 5. Composer install
```sh
composer install
```