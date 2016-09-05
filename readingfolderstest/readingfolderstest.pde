import java.io.File;

// we'll have a look in the data folder
java.io.File folder = new java.io.File(dataPath("/Users/BoxFactory/Developer/Processing/Free-Speech-Karaoke-Machine/sketch_5_pres_karaoke/data"));
 
// list the files in the data folder
String[] filenames = folder.list();
 
// get and display the number of jpg files
println(filenames.length + " jpg files in specified directory");
 
// display the filenames
for (int i = 0; i < filenames.length; i++) {
  println(filenames[i]);
}

  exit(); // kill program