## DUTY PHARMACY APP WITH GOOGLE MAPS
<br/>
<p align="center">
  <a href="https://github.com/ShaanCoding/ReadME-Generator">
    <img src="https://github.com/NazimCimen/flutter_duty_pharmacy_app/blob/main/assets/images/applogo.png" alt="Logo" width="180" height="180">
  </a>
</p>

## 📱 About Project


I am pleased to introduce to you the Duty Pharmacy App that I developed using Flutter. This application is designed to make it easy for users to find pharmacies on duty throughout Turkey and the Turkish Republic of Northern Cyprus.



![Screen Shot](https://github.com/NazimCimen/flutter_duty_pharmacy_app/blob/main/assets/images/myapp.png)

## 🌟 Features

- 🌐 Cross-Platform, One Application: The application works seamlessly on iOS, Android, and Web platforms .🌟 responsive design.

- 🗺️ Discover Pharmacies on the Map: With Google Maps integration, you can view the locations of pharmacies on the map and choose the most convenient one.

- 📲 Personalized Experience: After entering your city and district information, your preferences are remembered by the application, eliminating the need to enter the same information every time you open it.

## 🌐 Technologies Used

- Architecture: I opted for the Model-View-Controller (MVC) architecture.

- State Management: Provider was used.

- HTTP Requests: Dio package was used.



Thank you for reviewing my project! Don't forget to visit the [www.linkedin.com/in/nazim-cimen] to share your feedback! 👨‍💻✨



## Getting Started

This is an example of how to list things you need to use the software and how to install them.

### 1. Cloning the Project

Follow these steps to clone the project to your local machine:

1. Open your terminal or command prompt.

2. Navigate to the directory where you want to clone the project.

3. Run the following command to clone the repository:

   ```bash
   git clone https://github.com/NazimCimen/flutter_duty_pharmacy_app.git

### 2. HOW TO GET DUTY PHARMACY API

1. Get a  API Key at [https://example.com](https://www.nosyapi.com/)

2. Open the lib/utility/extensions/api_extensions.dart file in the project.

3. In the code block below, paste your API key into the your_api_key field:


```dart
case ApiServiceConts.authorizationToken:
    return 'your_api_key';
case ApiServiceConts.apikey:
    return 'your_api_key';
```

### 3. HOW TO GET GOOGLE MAP API

1. Create a new project on Google Cloud Console to use the Google Maps API.

2. Enable the Maps JavaScript API and obtain an API key.

3. Insert the obtained API key into the following locations:

-Find the android/app/src/main/AndroidManifest.xml file and add your API key:
```xml
        <meta-data android:name="com.google.android.geo.API_KEY"
            android:value="YOUR_API_KEY" />

```

-Find the pharmacy_app/web/index.html file and add your API key:
```html
 <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=drawing,visualization,places">

```

-Find the ios/Runner/AppDelegate.swift file and add your API key:
```swift
GMSServices.provideAPIKey("your_api_key")

```




