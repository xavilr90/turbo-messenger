To start:

1. Upgrade Node to latest version (at least 18.x.x)
2. Run npx next dev

To initialize db:

1. Go to postgres folder
2. Run docker build -t final-project-db . to create the postgres image 
3. Run docker run --name final-project-db -e POSTGRES_PASSWORD=postgres -p 5432:5432 final-project-db to start the container 