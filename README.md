# 📆 **Shift Scheduler App**

A simple shift scheduler app built with Bash scripting.

## 📝: **Description**

This side-project is created using Bash scripting to help manage shift schedules. It allows you to assign team members to different shifts while adhering to specified limitations and what output it shows when the following conditions are not met.

## ⚙️: **Getting Started**

### 📦: **Dependencies**

- **Bash Shell**: The script is created using the **Bash shell**. While it is recommended to run the script using Bash, it may also work on other Unix-like shells (e.g., `sh`, `zsh`). However, Bash is preferred for compatibility.
- **Docker**: Ensure you have Docker installed on your system if you prefer using Docker. You can download and install Docker from [Docker's official website](https://www.docker.com/get-started) or refer to [Docker's documentation page](https://docs.docker.com/desktop/).

### 💾: **Installation**

- No installation is required for the script. Simply download or clone the repository and make sure the script has execute permissions.

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
     docker run -it --rm -v $(pwd)/data:/app/data adriancuevas/shift-scheduler
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
     docker run -it --rm -v $(pwd)/data:/app/data shift-scheduler
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

## ⌨️ **Authors**

Contributors to this project:

- **Ralph Khen Adrian Cuevas**  
  GitHub: [@AAdrianC](https://github.com/AAdrianC)
- **Ken Jolo Takano**  
  GitHub: [@kencaleston69](https://github.com/kencaleston69)
- **Kim Gabriel Santiago**  
  GitHub: [@santreal27](https://github.com/santreal27)
- **Ralph Garlando**  
  GitHub: [@rgarlando23](https://github.com/rgarlando23)
