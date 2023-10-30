# tweetSenti
## Introduction
This is an application built as a part of my Software Engineering course. It explores the concept of sentimental analysis with the help of Twitter. 
## Working
1. A user is welcomed to an onboarding screen where he or she registers their details which are securely committed onto the firestore database provided by Google.
2. Once they are registered, they come to the main screen of the application. They can enter any text onto the textfield presented.
3. On clicking continue, they are presented with a sentimental score based on tweets containing the text they sent.
4. A Twitter API for searching and fetching tweets based on the text they sent is implemented. These tweets are processed through an mlmodel which predicts their sentimental score.
5. The users can view their past records in the Past Records page.
6. They can sign out and sign in with their account. 


