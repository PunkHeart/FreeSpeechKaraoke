void Submit() {
  println();
  print("this is the text you typed: ");
  speechPresident=cp5.get(Textfield.class, "president").getText();
  speechYear=cp5.get(Textfield.class, "year").getText();
  readerName=cp5.get(Textfield.class, "reader").getText();
  speechName=speechPresident + "_" + speechYear + ".txt";
  speechName=speechName.toLowerCase();
  print(speechName + " performed by " + readerName);
  //ADD FIELD VERIFICATION!!!!!!!! before next step:
  
// we'll have a look in the data folder
java.io.File folder = new java.io.File(sketchPath("data"));
 
// list the files in the data folder
String[] filenames = folder.list();
 
// get and display the number of jpg files
println(filenames.length + " jpg files in specified directory");
 
// display the filenames
for (int i = 0; i < filenames.length; i++) {
  println(filenames[i]);
}

File file = new File(dataPath(speechName));
     if (file.exists()) {
    println("I found it");
    speechError="";
    currentScreen=2;
} else {
speechError="Speech not found. Please try again.";
}}