ArrayList<float[]> outputs;

String[] outputNames = {
  "CAPEX",
  "OPEX",
  "COGs",
  "ATMDEM",
  "SECSUP"
};

int NUM_OUTPUTS = outputNames.length;

void initOutputs() {
  for (int i=0; i<NUM_OUTPUTS; i++) {
    outputs = new ArrayList<float[]>();
  }
}

void randomOutputs() {
  outputs.clear();
  
  float[] o;
  for (int i=0; i<NUM_INTERVALS; i++) {
    o = new float[NUM_OUTPUTS];
    for(int j=0; j<NUM_OUTPUTS; j++) {
      o[j] = 0.9/(j+1) * (i+1)/20.0;
    }
    outputs.add(o);
  }
  
  // Set KPI Radar to Last Available Output array
  o = outputs.get(outputs.size() - 1);
  for (int i=0; i<NUM_OUTPUTS; i++) {
    kpi.setScore(i, o[i]);
  }
}
