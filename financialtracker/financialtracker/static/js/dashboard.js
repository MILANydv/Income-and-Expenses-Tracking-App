const renderChart = (data, labels, data1, labels1) => {
    var ctx = document.getElementById("Chart").getContext("2d");
    var myChart = new Chart(ctx, {
      type: "line",
      data: {
        labels: labels,labels1,
        
        datasets: [
          {
            label: "Last 12 months Income",
            data: data,
            backgroundColor:'transparent',
            borderColor:'green',
            borderWidth: 3,
          },
          {
            label: "Last 12 months Expenses",
            data: data1,
            backgroundColor:'transparent',
            borderColor: 'red',
            borderWidth: 3,
          },
          
        ],
      },
      
      options: {
        element:{
          line:{
            tension:0
          }
        },
        title: {
          display: true,
          text: "Income Vs Expenses",
        },
      },
    });
  };











  // ---------------------------for Income --------------
  const getChartData = () => {
    console.log("fetching");
    fetch("income/income_date_summary")
      .then((res) => res.json())
      .then((results) => {
        console.log("results", results);
        const source_data = results.income_date_data;
        const [labels, data] = [
          Object.keys(source_data),
          Object.values(source_data),
        ];
  
        renderChart(data, labels);
      });
  };

 

// ---------------------------for Expenses --------------
const getChartData1 = () => {
  console.log("fetching");
  fetch("/expenses_date_summary")
    .then((res) => res.json())
    .then((results) => {
      console.log("results", results);
      const source_data1 = results.expense_date_data;
      console.log("Scource", source_data1)
      const [labels1, data1] = [
        Object.keys(source_data1),
        Object.values(source_data1),
      ];

      renderChart(data1, labels1);
    
    });
};



  
  
  document.onload = getChartData(),getChartData1();






  