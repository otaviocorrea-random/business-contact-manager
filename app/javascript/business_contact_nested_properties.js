var dataList = [];
var dataEdit = {};

const generateTableData = (data) => {
  const tbody = document.getElementById('nested_productive_properties').getElementsByTagName('tbody')[0];
  tbody.innerHTML = '';
  
  data.forEach(property => {
    let newRow = tbody.insertRow();
    newRow.id = `nested_property_${property.id}`;
    newRow.innerHTML = trData(property);
  });
}

const fethcNestedPropertiesData = (callback = null) => {
  const url = `http://localhost:3000/productive_properties.json?business_contact_id=${businessContactId}`;
  fetch(url)
    .then(response => response.json())
    .then((data) => {
      console.log(data);
      generateTableData(data);
      dataList = data;
      if (callback) callback();
    });
}

const trData = (data) => {
  let html = '';
  
  html += `<td scope="row" id="pp_name_${data.id}">${data.name}</td>`;
  html += `<td scope="row" id="pp_area_${data.id}">${data.area} m²</td>`;
  html += `<td scope="row" id="pp_spacerow_${data.id}">${data.space_between_rows} ${data.space_between_rows_unit}</td>`;
  html += `<td scope="row" id="pp_spaceplant_${data.id}">${data.space_between_plants} ${data.space_between_plants_unit}</td>`;
  html += `<td scope="row">${data.number_of_plants}</td>`;
  html += `<td scope="row">${data.plant_species_count}</td>`;
  html += `<td>`;
  html += `<button onclick='changeToEdit(${data.id})' class="btn btn-primary btn-sm">✏️</button>`;
  html += `</td>`;

  return html;
}

const trEditData = (data) => {
  dataEdit = data;
  let html = '';
  
  html += `<td scope="row"><input type='text' class="form-control" name='name' onchange='updateEditData(event)' value='${data.name}'></td>`;
  html += `<td scope="row"><input type='number' class="form-control" name='area' onchange='updateEditData(event)' style="width: 70px" value='${data.area}'> m²</td>`;
  html += `<td scope="row"><input type='number' class="form-control" name='space_between_rows' onchange='updateEditData(event)' style="width: 70px" value='${data.space_between_rows}'> ${data.space_between_rows_unit}</td>`;
  html += `<td scope="row"><input type='number' class="form-control" name='space_between_plants' onchange='updateEditData(event)' style="width: 70px" value='${data.space_between_plants}'> ${data.space_between_plants_unit}</td>`;
  html += `<td scope="row">${data.number_of_plants}</td>`;
  html += `<td scope="row">${data.plant_species_count}</td>`;
  html += `<td>`;
  html += `<button onclick='updateNestedProperty()' class="btn btn-primary btn-sm">💾</button>`;
  html += `</td>`;

  return html;
}

const updateEditData = (event) => {
  dataEdit[event.target.name] = event.target.value;
  console.log(dataEdit);
}

const changeToEdit = (id) => {
  generateTableData(dataList);
  let data = getDataById(id);
  const row = document.getElementById(`nested_property_${data.id}`);
  row.innerHTML = trEditData(data);
}

const updateNestedProperty = () => {
  const url = `http://localhost:3000/productive_properties/${dataEdit.id}.json`;
  fetch(url, {method: 'PATCH', body: JSON.stringify({productive_property: dataEdit}), headers: {'Content-Type': 'application/json'}})
    .then(response => response.json())
    .then((data) => {
      if (data.errors){
        alert(data.errors.join("\n"));
      }else{
        fethcNestedPropertiesData();
        dataEdit = {};
      }
    });
}

const getDataById = (id) => {
  return dataList.find(data => data.id == id);
}

const businessContactId = document.getElementById('business_contact_id').value;

const init = () => {
  fethcNestedPropertiesData();
}

init();