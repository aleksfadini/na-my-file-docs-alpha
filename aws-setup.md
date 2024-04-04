# Creating an IAM User for Infrastructure Deployment

This document outlines the steps to create an IAM (Identity and Access Management) user with the necessary permissions to deploy infrastructure on your AWS account. Using an IAM user instead of the root user is a recommended best practice for security and accountability.

## Prerequisites

1. An AWS account with root user access (you would need a credit card and an email address for that).
2. Access to the AWS Management Console (you would need the login and password obtain in step 1).

## Steps

1. **Sign in to the AWS Management Console:**

   - Open your web browser and navigate to the AWS Management Console.
   - Sign in using your root user account credentials.

2. **Navigate to the IAM service:**

   - Once signed in, click on the "Services" menu at the top of the page.
   - Search for "IAM" in the search bar and click on "IAM" to open the IAM dashboard.

3. **Create a new IAM user:**

   - In the IAM dashboard, click on "Users" in the left sidebar.
   - Click on the "Add user" button.
   - Enter a user name for the new IAM user (e.g., "deployment-user").
   - Select the access type for the user:
     - Select "Programmatic access" if you want to use the AWS CLI or AWS SDKs for deployment.
     - Select "AWS Management Console access" if you want the user to have access to the AWS Management Console.
   - Set the console password and password reset requirements for the user (if applicable).
   - Click on "Next: Permissions."

4. **Assign permissions to the user:**

   - On the permissions page, you have three options:
     - Attach existing policies directly: Select existing IAM policies that grant the necessary permissions for deployment. Look for policies related to the services you'll be using (e.g., S3, CloudFront, Route 53, ACM Private CA).
     - Create a new policy: If you can't find a suitable existing policy, create a new policy by clicking on "Create policy." Use the visual editor or JSON editor to define the permissions required for your deployment.
     - Add user to a group: If you have an existing IAM group with the necessary permissions, add the user to that group.
   - Review the permissions and click on "Next: Tags."

5. **Add tags (optional):**

   - If desired, add any tags to the user for organizational or tracking purposes.
   - Click on "Next: Review."

6. **Review and create the user:**

   - Review the user details and permissions.
   - If everything looks correct, click on "Create user."
   - After the user is created, you'll see the user's Access Key ID and Secret Access Key (if you selected programmatic access).
   - Make sure to download or copy these credentials securely, as you won't be able to view the Secret Access Key again.

7. **Configure the AWS CLI:**

   - On your local machine, install the AWS CLI if you haven't already.
   - Open a terminal or command prompt.
   - Run the command `aws configure` and provide the Access Key ID and Secret Access Key when prompted.
   - Set the default region and output format as per your preferences.

8. **Use the IAM user for deployment:**
   - You can now use the IAM user's credentials to deploy your infrastructure using the AWS CLI or AWS SDKs.
   - Make sure to use the appropriate commands and tools based on your deployment setup; for _My File_, follow the installation and deployment guides.

## Best Practices

- Follow the principle of least privilege and grant only the permissions necessary for the IAM user to perform the deployment tasks.
- Regularly review and update the user's permissions to ensure they align with your security best practices.
- Consider using IAM roles instead of long-term access keys for EC2 instances or Lambda functions that require AWS permissions.
- Enable multi-factor authentication (MFA) for the IAM user to add an extra layer of security.

If you encounter any issues or need further assistance, please refer to the AWS IAM documentation.
