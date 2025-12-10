// Importing the table, 
Table table;
PImage pyro, hydro, geo, electro, cryo, anemo, dendro;

// Mapping the string to the images coordinating each day to each element (image)
HashMap<String, PImage> elemMap = new HashMap<String, PImage>();

// 14 Columns to represent every 2 weeks
int cols = 14;
int margin = 10;
float scaleFactor = 0.45; // Made it smaller for every date to be seen

void setup() {
  size(1100, 700);
  textFont(createFont("Arial", 10));  // smaller text

  loadImages();
  // Using my CSV file to import the correct data
  table = loadTable("My Dear Data Login Collections.csv", "header");

  noLoop();
}
// Loading my images - the Genshin elements!
void loadImages() {
  pyro = loadImage("pyro.png");
  hydro = loadImage("hydro.png");
  geo = loadImage("geo.png");
  electro = loadImage("electro.png");
  cryo = loadImage("cryo.png");
  anemo = loadImage("anemo.png");
  dendro = loadImage("dendro.png");

  elemMap.put("Pyro", pyro);
  elemMap.put("Hydro", hydro);
  elemMap.put("Geo", geo);
  elemMap.put("Electro", electro);
  elemMap.put("Cryo", cryo);
  elemMap.put("Anemo", anemo);
  elemMap.put("Dendro", dendro);
}

void draw() {
  background(242,235,226);
   
  // Retriving how many rows are needed and creating the responding columns
  int total = table.getRowCount();
  int rows = ceil(total / float(cols));

  //Makes space for the Weekday Icons at the bottom
  float cellW = (width - 2*margin) / cols;
  float cellH = (height - 200 - margin) / rows;  
  
  //Creating a title for my code and decorating it
  textAlign(CENTER, TOP);
  textFont(createFont("Arial Bold", 18));  
  fill(139, 0, 0);  
  text("My Dear Data Project Involving Genshin Impact! ( 1st Sept -> 9th Dec 2025 )", width/2, 10);
  
  // Resets the  smaller font
  textFont(createFont("Arial", 10));

  int index = 0;
  // Nested loop for the rows and columns created
  for (int r = 0; r < rows; r++) {
    for (int c = 0; c < cols; c++) {
      if (index >= total) 
          break;
      // Gets the row from the index
      TableRow row = table.getRow(index);
      // Uses the CSV file for the data i collected
      String date = row.getString("date");
      int opened = row.getInt("opened");
      String elem = row.getString("element");
      // Creates a space
      float x = margin + c * cellW;
      float y = 30 + r * cellH;

      drawCell(x, y, cellW, cellH, date, opened, elem);

      index++;
    }
  }

  // Visible Banner area
  drawBanner(height - 160);
}

// Using the width, height and CSV file, i add the correct correlated date and string
void drawCell(float x, float y, float w, float h, String date, int opened, String elem) {

  noFill();
  stroke(180);
  rect(x, y, w, h);

  fill(0);
  text(date, x + w/2, y + 1);
  
  // Using an If statement to see if 'opening the app is true'
  if (opened == 1 && elem != null && elem.length() > 0) {
    
    // Inserting the required element for the date using an if statement again
    PImage icon = elemMap.get(elem);
    
    
    if (icon != null) {
      float size = min(w, h) * scaleFactor;

      imageMode(CENTER);
      image(icon, x + w/2, y + h/2, size, size);

      fill(40);
      text(elem, x + w/2, y + h - 12);
    }
    // If not opened, it will draw an X mark
  } else {
    stroke(200);
    line(x + w*0.3, y + h*0.3, x + w*0.7, y + h*0.7);
    line(x + w*0.7, y + h*0.3, x + w*0.3, y + h*0.7);
  }
}

// Creating the bottom banner
void drawBanner(float yStart) {
  // Aligning the banner towards the centre
  textAlign(CENTER, CENTER);
  fill(0,0,0);
  textSize(20);
  
  // Title for the icons
  text("WEEK DAY = ELEMENT", width/2, yStart);
  
  // Creating a space underneath the banner
  yStart += 25;  
  
  // Spacing between each icon and tag
  float iconSize = 20;
  float spacing = 160; 
  // Labelling the icons and associating the labels using an array
  String[] labels = {
    "Monday = Pyro",
    "Tuesday = Hydro",
    "Wednesday = Geo",
    "Thursday = Electro",
    "Friday = Cryo",
    "Saturday = Anemo",
    "Sunday = Dendro"
  };
  // Collating the pictured elements
  PImage[] icons = {pyro, hydro, geo, electro, cryo, anemo, dendro};

  // Centring the elements pictures
  float startX = width/2 - spacing*3; 
  
 
  // Using the for loop to station the icons with the strings
  for (int i = 0; i < 7; i++) {
    float x = startX + i * spacing;
    drawBannerItem(labels[i], icons[i], x, yStart, iconSize);
  }
}

// Drawing the Banner
void drawBannerItem(String label, PImage icon, float x, float y, float size) {
  // Draw icon
  imageMode(CENTER);
  image(icon, x, y, size, size);

  // Decorating the banner's icons
  fill(0);
  textSize(15);
  text(label, x, y + size);
}
