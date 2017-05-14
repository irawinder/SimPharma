// A production unit that describes a socio-technical process for manufacturing a chemical entity at a site
class Build {

  // Name of Production Type (i.e. "Continuous Batch Hybrid")
  String name;
  
  //  Build/Repurpose  Size
  float capacity; 
  
  //  Build Cost, Build Time
  float buildCost, buildTime;
  
  //  Repurpose Cost, Repurpose Time
  float repurpCost, repurpTime; 
  
  // Operators (Amount, Shifts, Cost)
  ArrayList<Person> labor;
  
  // Status of Build when allocated to a site:
    
    // NCE profile produced by build
    int PROFILE_INDEX;
    // Is build operational, yet?
    boolean built;
    // How many years since the build has been comissioned?
    int age;
  
  // Basic Constructor
  Build() {
    labor = new ArrayList<Person>();
  }
  
  // The Class Constructor
  Build(String name, float capacity, float buildCost, float buildTime, float repurpCost, float repurpTime, ArrayList<Person> labor) {
    this.name = name;
    this.capacity = capacity;
    this.buildCost = buildCost;
    this.buildTime = buildTime;
    this.repurpCost = repurpCost;
    this.repurpTime = repurpTime;
    this.labor = labor;
  }
  
  // Allocate Specific Profile Information to a Build when it is deployed on Site
  void assignProfile(int index) {
    PROFILE_INDEX = index;
    built = false;
    age = 0;
  }
  
  // Update Temporal aspects of build, such as age and construction progress
  void updateBuild() {
    age++;
    if (age >= buildTime) {
      // Build becomes active after N years of construction
      built = true;
    }
  }
  
  void draw(int x, int y, String type, boolean selected) {
    // Draw Build Characteristics
    int scaler = 4;
    fill(abs(textColor - 75));
    rect(x + 155, y, scaler*capacity, 10, 3);
    textAlign(LEFT);
    fill(textColor);
    text(capacity + " " + agileModel.WEIGHT_UNITS, x + 155 + scaler*capacity + 3, y + 9);
    if (type.equals("GMS")) {
      text(int(buildTime) + " " + agileModel.TIME_UNITS + ", " + int(buildCost/100000)/10.0 + agileModel.COST_UNITS, x, y + 9);
      text(int(repurpTime) + " " +agileModel.TIME_UNITS + ", " + int(repurpCost/100000)/10.0 + agileModel.COST_UNITS, x + 80, y + 9);
    } else {
      text(int(repurpTime) + " " +agileModel.TIME_UNITS + ", " + int(repurpCost/100000)/10.0 + agileModel.COST_UNITS, x + 80, y + 9);
    }
    for (int i=0; i< labor.size(); i++) {
      if (labor.get(i).name.equals(agileModel.LABOR_TYPES.getString(0,0) )) {
        fill(#CC0000);
      } else if (labor.get(i).name.equals(agileModel.LABOR_TYPES.getString(1,0) )) {
        fill(#00CC00);
      } else if (labor.get(i).name.equals(agileModel.LABOR_TYPES.getString(2,0) )) {
        fill(#0000CC);
      } else if (labor.get(i).name.equals(agileModel.LABOR_TYPES.getString(3,0) )) {
        fill(#CCCC00);
      } else if (labor.get(i).name.equals(agileModel.LABOR_TYPES.getString(4,0) )) {
        fill(#CC00CC);
      } else {
        fill(#00CCCC);
      }
      ellipse(x +157 + i*6, y + 20, 3, 10);
    }
    
    // Draw Build Selection Box
    if (selected) {
      noFill();
      stroke(#CCCC00, 100);
      strokeWeight(4);
      rect(x - 10, y - 10, 160, 30, 5);
      noStroke();
    }
  }
}