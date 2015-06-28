 #full_description_police_force {
  marker-fill: #ff0000; 
  marker-line-color: #ffffff;
  marker-spacing: 50;
  marker-allow-overlap: true;
  marker-avoid-edges: true;
  
  [zoom<=10] { 
    marker-width: 3px;
    marker-opacity: .75;
    marker-line-width: 1px;
    marker-allow-overlap: false;
    marker-spacing: 25;
  }
  [zoom>=10] { 
    marker-width: 6px;
    marker-opacity: .70;
    marker-line-width: 1px;
    marker-allow-overlap: false;
    marker-spacing: 20;
  }
  [zoom>=12] { 
    marker-width: 8px;
    marker-opacity: .65;
    marker-line-width: 2px;
    marker-allow-overlap: false;
    marker-spacing: 35;
  }
  [zoom>=13] { 
    marker-width: 12px;
    marker-line-width: 2px;
    marker-allow-overlap: false;
  }
  [zoom>=14] { 
    marker-width: 15px;
    marker-line-width: 3px;
    marker-allow-overlap: true;
  }
  [zoom>=15] { 
    marker-width: 22px;
    marker-line-width: 4px;
  }
}
