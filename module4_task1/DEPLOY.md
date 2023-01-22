# DEPLOY.md

## Deployment file

### What is in the archive and how to unarchive it?

- It is a compressed file that is the `awesome-website.zip`.
- To unarchive it, use the command `unzip` [name of the file]

### What are the commands to start and stop the application?

- We can start and stop the application with `make build` and `make clean`

### How to customize where the application logs are written?

- I don't know

### How to “quickly” verify that the application is running (healthcheck)?

- To verify that the application is running, run `hugo server`.
- Check this out on local host [http://localhost:1313]

### Releases

- A new release is created with `awesome-website.zip` file archive
- This archive is added to the release `1.0.0`
- This release is pointing to the tag `1.0.0`
