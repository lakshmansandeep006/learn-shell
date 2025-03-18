List of actions: 
1) Create a github account 
2) Install GitBash & VSCode on your computer ( If mac, just install git by using "brew install git" )
3) Create a repo named "learn-shell" and this is where we are going to host or upload all our work ( Public repo )
4) Open your gitBash, create a folder named b58 ( mkdir b58/ )
5) cd b58/ ---> then doa  ```git clone "https url of your repo"``` , this is going to create the repo 
6) On your gitbash, "# code learn-shell" , this will open the folder on your VSCode

Going forwared we are going to do the same for all the repositories. 


### Basic Git Commands ( Which we are going to do continuously )

    1) git clone             ( to download the entire repository )
    2) git pull              ( to download just the changes that your don't have ) 
    3) git commit -m "msg"   ( before you push anything, make sure you tell what you're doing in the comming msg ) 
    4) git push              ( Publishes the changed to your repo )
 

 
Note:
1) If the repo is public, anyone can download/clone the repo without the need of authenticaiton 
2) if the repo is public/private, only the owner or team who has access to that repo can only publish 


### So, how to authenticate to our GitHub account from our computer ?

    1) On your GitHub account, generate a PAT ( Personal Access Token )
    2) Now save that on a notePad, on your VSCode, run the "git push" couple of times and you'd see the prompt to enter the token
    3) That's it and it's an one time effort and from now you can publish the code to your repo n number of times.
    