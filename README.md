# A museum visitor's smart phone app with bluetooth beacons
## Introduction
This project designs a database for the museum, a web interface for managing the database 
and a smart phone application that can play audio clips of exhibits.  
Suppose there is a Bluetooth 
beacon near each exhibit in the museum. When a smart phone approaches the Bluetooth 
beacon, the app will display the basic information of the exhibits and broadcast the audio 
snippets of the exhibits' information.  
The project include two part, one of which is the web interface, with functions of:
*	Create information about various exhibits  
*	Update information about various exhibits  
*	Retrieve information about various exhibits  
*	Delete information about various exhibits  

The other part is iOS smartphone applications, with functions of:  
*	Detect Bluetooth Beacons around the smart phone  
*	Display the information of the exhibits corresponding to the Bluetooth beacon  
*	Play audio snippets of information about each of the museum exhibits  
*	Send the Bluetooth beacon data to the server and request the exhibits data  

## Implementation Tool
&nbsp;       |Tool | Language | Framework
:-----------: |:-----------: |:-------------:| :-----------:
**Web interface**|Atom         | HTML<br>JavaScript<br>CSS          | Bootstrap
**Server system**|IntelliJ IDEA         | Java          | Spring Boot<br>MyBatis<br>Thymeleaf
**iOS application**|Xcode         | Swift          | None

## Build
As this project is supposed to build with a IP address, for server the project needs to set the IP address, port number, and corresponding SSL certificate for the project deployment in the Spring Boot project properties file. The default SSL certificate for this project is our self-signed certificate.
For iOS smart phone applications, when the server deployed by the project is changed, the IP address of the deployed server should also be modified in the code. At the same time, the SSL certificate file used in the project also needs to change.
Type in terminal  

```console
Java-jar museum-0.0.1-snapshot.jar --port=8080 --address=10.28.148.205
```

to start the project. Address and port will change if you deploy the project on other server. The project is deployed on the BUPT Campus LAN.  
![image](https://user-images.githubusercontent.com/44118457/177214083-4064951d-7593-4a76-bcc2-9a88219a4798.png)

## Tutorial
### Guidance on Web management system  

Under the premise that server deployment of the system is guaranteed, first open the URL "https://10.28.148.205:8080" into the directory page. It is worth noting that the system is deployed on a LAN server with IP address of 10.28.148.205 and port number of 8080.  
 ![image](https://user-images.githubusercontent.com/44118457/177214905-95a0a70b-9374-41c7-9f68-c2c420935a40.png)

After that, we enter the system by default username “admin” and the password “123456”.

![image](https://user-images.githubusercontent.com/44118457/177214923-9578c3c1-e975-4d7c-8ed2-efac9910e55c.png)


Then we come to the Dashboard page, where you can select the contents of the table you want to view from the navigation bar on the left.
This is the data of the exhibit table.

![image](https://user-images.githubusercontent.com/44118457/177214942-7dcc18a8-9e86-4a73-9bbf-1539171099c5.png)


This is the data of the author table.

![image](https://user-images.githubusercontent.com/44118457/177214959-55c02a64-8e13-4f5b-9257-bc9902aefc16.png)


This is the data of the room table.

![image](https://user-images.githubusercontent.com/44118457/177214966-4b939287-b20d-4958-b1e4-bd33da67d7aa.png)


This is the data of the BluetoothBeacon table.

![image](https://user-images.githubusercontent.com/44118457/177214977-4afe56e0-4fdd-4c6a-8fc0-bb5313539bff.png)


This is the data of type table.
 
![image](https://user-images.githubusercontent.com/44118457/177214987-11fad831-b823-47dc-97e4-194cfb53c534.png)
#### Add

When we want to add data to a table in the database, we can click the "Add" button on the page.  

![image](https://user-images.githubusercontent.com/44118457/177215063-0900d23d-e70a-4f4e-be2c-ca416f048fa4.png)


After that, we will enter the Add page. After filling in the data in the form, click the "Add" button to add the data to the database.  

![image](https://user-images.githubusercontent.com/44118457/177215076-a84555a5-eb46-4600-b62f-abea68de2d71.png)
![image](https://user-images.githubusercontent.com/44118457/177215086-dcb011ed-c867-4d05-9339-a5f28b8f654f.png)


Then we can see the data we just add.

![image](https://user-images.githubusercontent.com/44118457/177215097-0332e746-5e64-44ac-a553-2a2174231bf9.png)  

#### Update

When we want to update data to a table in the database, we can click the "Update" button on the page.  
 ![image](https://user-images.githubusercontent.com/44118457/177218783-cf5ee43e-99cf-4d82-9585-98f0261b1523.png)

Then we can change the data in the form, and click “update” button to submit.  
 ![image](https://user-images.githubusercontent.com/44118457/177218789-90b45d97-aa4e-45b6-9c79-8a09d7a64459.png)

Here we have changed the date from "2021/4/15" to "2021/4/16", and you can see that the data in the list page has also changed accordingly.  
 ![image](https://user-images.githubusercontent.com/44118457/177218794-28d23ca1-2afa-4752-b161-a2fcecc7d945.png)

#### Delete  

When we want to delete data from the database, we can click “delete” button to delete one column of the data.  
 ![image](https://user-images.githubusercontent.com/44118457/177218799-17f6daaa-eef1-49e8-8b24-b7247342750b.png)

Here we choose to delete the data with ID 4.  
 ![image](https://user-images.githubusercontent.com/44118457/177218806-c1afdf6c-ff57-48f2-b4a6-106317860a20.png)

successfully delete.  
### Guidance on iOS smart phone app
When you get into the app, you first need to login. This is the login page.  
 ![image](https://user-images.githubusercontent.com/44118457/177218889-abf867de-3d0a-477a-806b-b821e83a5a64.png)

If you click the register button, you will be taken to the register page.  
 ![image](https://user-images.githubusercontent.com/44118457/177218895-10207505-39dc-4f50-a2d5-ed8b236eed4a.png)

After you have successfully logged in, you will be taken to the home page.  
 ![image](https://user-images.githubusercontent.com/44118457/177218902-17b4595a-86f9-4c0b-86bf-8bee98b39377.png)

When you approach a Bluetooth beacon, the interface will automatically jump to the display information corresponding to the beacon, and can provide a button to play an audio snippet for you.  
 ![image](https://user-images.githubusercontent.com/44118457/177218906-d7effd66-bf69-43fd-9caa-a112a12c4a50.png)

When you click the button, the app will play the audio snippet of the exhibit.  
