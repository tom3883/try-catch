d3 = 


data = FileAttachment("BarChartRace/category-brands.csv").csv({typed: true});

console.log("AAAAHHHHHH")
const svg = d3.create("svg")
  .attr("viewBox", [0, 0, width, height])
  .attr("width", width)
  .attr("height", height)
  .attr("style", "max-width: 100%; height: auto;");

  let duration = 250;
  const n = 12;
  const k = 10;

const updateBars = bars(svg);
const updateAxis = axis(svg);
const updateLabels = labels(svg);
const updateTicker = ticker(svg);


const keyframes = [];
  let ka, a, kb, b;
  for ([[ka, a], [kb, b]] of d3.pairs(datevalues)) {
    for (let i = 0; i < k; ++i) {
      const t = i / k;
      keyframes.push([
        new Date(ka * (1 - t) + kb * t),
        rank(name => (a.get(name) || 0) * (1 - t) + (b.get(name) || 0) * t)
      ]);
    }
  }
  keyframes.push([new Date(kb), rank(name => b.get(name) || 0)]);

for (const keyframe of keyframes) {
  const transition = svg.transition()
    .duration(duration)
    .ease(d3.easeLinear);

  // Extract the top bar's value.
  x.domain([0, keyframe[1][0].value]);

  updateAxis(keyframe, transition);
  updateBars(keyframe, transition);
  updateLabels(keyframe, transition);
  updateTicker(keyframe, transition);

  invalidation.then(() => svg.interrupt());
  transition.end();
}