# 📆 **Shift Scheduler App**

A simple shift scheduler app built with Bash scripting. 

## 📝: **Description**

This side-project is created using Bash scripting to help manage shift schedules. It allows you to assign team members to different shifts while adhering to specified limitations and displays the output when the conditions are not met. 

### CI/CD Integration
The project can be integrated with a CI/CD pipeline using Jenkins. Whenever changes are pushed to the GitHub repository, the pipeline triggers Jenkins, which then automatically deploys new pods to the Kubernetes cluster. This setup ensures that the latest updates and improvements are continuously and seamlessly delivered to the application.

## ⚙️: **Getting Started**

### 📦: **Dependencies for Running the App**

- **Bash Shell**: The script is created using the **Bash shell**. While it is recommended to run the script using Bash, it may also work on other Unix-like shells (e.g., `sh`, `zsh`). However, Bash is preferred for compatibility.
- **Docker**: Ensure you have Docker installed on your system if you prefer using Docker. You can download and install Docker from [Docker's official website](https://www.docker.com/get-started) or refer to [Docker's documentation page](https://docs.docker.com/desktop/).

### 📦: **Dependencies for CI/CD Integration**
If you want to simulate how CI/CD works by deploying the app in a Kubernetes cluster using Jenkins and utilizing triggers for changes, you need:
- **KodeKloud CI/CD Playground**: This project is set up in the KodeKloud CI/CD Playground, which includes a pre-installed Jenkins server, Gitea (a self-hosted Git service), Maven (a build automation tool for Java projects), Docker (a containerization platform), and a single-node Kubernetes cluster (an open-source container orchestration platform). You can access the playground from [KodeKloud's official website](https://kodekloud.com/playgrounds/playground-ci-cd).

### 💾: **Installation**

- **For Running the App**: No installation is required. Simply download or clone the repository and make sure the script has execute permissions.
- **For CI/CD Integration**: All the required tools and services are pre-installed in the KodeKloud CI/CD Playground. No additional installation is needed; you can directly use the playground environment to test and deploy the application.

### 🚀: **Executing Program**

There are three methods to run the script:

1. **Directly Using the Script**:

   - **Ensure the Script is Executable**:
     ```bash
     chmod +x shift_sched.sh
     ```

   - **Run the Script**:
     ```bash
     ./shift_sched.sh
     ```

   This will execute the script directly in your Bash shell.

2. **Using Docker Image**:

   - **Create a Directory for Data**:
     ```bash
     mkdir -p data
     ```

   - **Run the Docker Image**:
     ```bash
     docker run -d -p 8080:8080 adriancuevas/shift-scheduler:latest
     ```

   This command will run the application using the pre-built Docker image `adriancuevas/shift-scheduler`. It mounts the `data` directory from your current working directory to `/app/data` in the container.

3. **Using Dockerfile**:

   - **Build the Docker Image**:
     ```bash
     docker build -t shift-scheduler .
     ```

   This command will build the Docker image using the Dockerfile in the current directory and tag it as `shift-scheduler`.

   - **Run the Docker Container**:
     ```bash
     docker run -d -p 8080:8080 adriancuevas/shift-scheduler:latest
     ```

   This will use the Docker image to run the application. It mounts the `data` directory from your current working directory to `/app/data` in the container.

## 📖: **Script Overview**

Here’s a step-by-step guide to using the `shift_sched.sh` script:

1. **Run the Script**:
   - Execute the script using one of the methods mentioned above.

2. **Input the Details**:
   - **Name**: Enter the name of the team member. If you want to see the current schedule and exit, enter the word `print`.
   
   - **Shift**: Specify the shift for the team member from the following options:
     - Morning
     - Mid
     - Night
   
   - **Team**: Choose the team for the team member from these options:
     - A1
     - A2
     - B1
     - B2
     - B3

3. **Errors**: If an input isn't recognized, you will be prompted to either continue or exit.

## ❗: **Conditions**

1. **Maximum Capacity**: Only 2 people are allowed per shift in each team.
2. **Print and Exit**: If the input for the name is "print", the script will display the current schedule and exit.
3. **Completion**: The script will continue to prompt for input until all teams are full.
4. **Case Insensitive**: The script will register the input, regardless of its case sensitivity.

## 🔄: **CI/CD Integration Steps**

1. **Access the KodeKloud CI/CD Playground**:
   - Visit [KodeKloud's official website](https://kodekloud.com/playgrounds/playground-ci-cd) to access the sandbox.

2. **Open the Jenkins UI**:
   - Click the `Jenkins UI` located at the top right of the playground. Use the credentials provided in the `Task` description to log in.

3. **Install the Build Authorization Token Root Plugin**:
   - Navigate to `Dashboard > Manage Jenkins > Manage Plugins`.
   - Install the `Build Authorization Token Root Plugin` from the available plugins.

4. **Add Credentials**:
   - Go to `Dashboard > Manage Jenkins > Manage Credentials`.
   - Add credentials for GitHub and DockerHub:

     - **GitHub Credentials**:
       - Use any GitHub account.

     - **DockerHub Credentials**:
       - **Username**: adriancuevas
       - **Password**: EhhPaanoKung...
       - **ID**: docker-hub-credentials
      
5. **Create a Job**:
   - Navigate to `Dashboard > New Item`.
   - Select `Pipeline` and enter a name for the job.
   - Click `OK` to create the pipeline job.

   - **Configure Build Triggers**:
     - Go to the `Build Triggers` section.
     - Check the box for `Trigger builds remotely (e.g., from scripts)`.
     - Generate an `Authentication Token` and make a note of it for setting up the webhook.

   - **Configure Pipeline**:
     - In the `Pipeline` section, select `Pipeline script from SCM` under `Definition`.
     - Choose `Git` as the SCM option.
     - Enter the repository URL: `https://github.com/AAdrianC/shift-scheduler.git` or your own forked repository URL.
     - Select your GitHub credentials from the drop-down menu.
     - Change the `Branch Specifier` under `Branches to build` to `main`.
     - Click `Save` to create the Job.

6. **Configure Webhook**:
   - Navigate to the GitHub repository of the project, or your own forked repository. The project is public, so anyone can fork it if needed.
   - Go to `Settings > Webhooks` in the repository.
   - Click on `Add webhook`.
   - In the `Payload URL` field, enter the Jenkins build URL with the token. The URL should be in the format: `https://<jenkins-url>/buildByToken/build?job=<job-name>&token=<your-token>`.
     - Replace `<jenkins-url>` with your Jenkins server URL.
     - Replace `<job-name>` with the name of your Jenkins job.
     - Replace `<your-token>` with the authentication token you created in Jenkins.
   - Set the `Content type` to `application/json`.
   - Choose the `Just the push event` option to trigger the webhook on pushes to the repository.
   - Click `Add webhook` to save the configuration.

7. **Access the Docker Host**:
   - Access the Docker host using the following command in the `jump-host` terminal:
     ```bash
     ssh -l admin docker-host
     ```

8. **Run the Build**:
   - From the Jenkins UI, select the job you created and click `Build Now`.

9. **Verify CI/CD Integration**:
   - Make any changes in the repository and ensure that these changes are committed.
   - Return to the Jenkins UI and verify if a new build was triggered for the job you created.
   - Access the `jump-host` terminal and run the following command to verify if the new pods are running in the Kubernetes cluster:
     ```bash
     kubectl get pods -n production
     ```

## ⌨️ **Authors**

Contributors to this project:

- **Ralph Khen Adrian Cuevas**  
  GitHub: [@AdCuevas12](https://github.com/AdCuevas12)
- **Ken Jolo Takano**  
  GitHub: [@kencaleston69](https://github.com/kencaleston69)
- **Kim Gabriel Santiago**  
  GitHub: [@santreal27](https://github.com/santreal27)
- **Ralph Garlando**  
  GitHub: [@rgarlando23](https://github.com/rgarlando23)
