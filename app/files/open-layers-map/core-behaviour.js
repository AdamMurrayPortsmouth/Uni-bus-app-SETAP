/*
    Layers
*/

// This layer shows Bing maps.

import {ol} from "./ol-v6.13.0/ol";

const rasterLayer = new ol.layer.Tile({
    source: new ol.source.BingMaps({
        key: 'LKWeGV5hgC5HHHG4V7hY~iB_5lc6FjIxDktEpAU2dXw~AnwVbzV433LA6i_4U4NcMYmZ0dUpAPanUAJt3Ru2SWuEIjFnZyZ1gnG8neDCI1I2',
        imagerySet: "AerialWithLabelsOnDemand",
    }),
});

/*
    Map
*/

const map = new ol.Map({
    view: new ol.View({
        center: new ol.proj.fromLonLat([0, 0]),
        zoom: 5,
    }),
    layers: [rasterLayer],
    target: "js-map" // Change this to 'map'
});