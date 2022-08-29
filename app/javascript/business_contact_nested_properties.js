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
  const url = `/productive_properties.json?business_contact_id=${businessContactId}`;
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
  html += `<button onclick='changeToEdit(${data.id})' class="btn btn-primary btn-sm">✏️</button> `;
  html += `<button onclick='deleteNestedProperty(${data.id})' class="btn btn-danger btn-sm">🗑️</button> `;
  html += `<button onclick='window.location.href = "/productive_properties/${data.id}"' class="btn btn-secondary btn-sm">👁️</button>`;
  html += `</td>`;

  return html;
}

const trEditData = (data) => {
  let isEdit = data.id ? true : false;
  if (!isEdit){
    data.business_contact_id = businessContactId;

    data.space_between_rows_unit = 'cm';
    data.space_between_plants_unit = 'cm';
  }
  dataEdit = data;
  let html = '';
  
  html += `<td scope="row"><input type='text' class="form-control" name='name' onchange='updateEditData(event)' value='${data.name ||  ''}'></td>`;
  html += `<td scope="row"><input type='number' class="form-control" name='area' onchange='updateEditData(event)' value='${data.area || ''}'> (em m²)</td>`;
  html += `<td scope="row"><input type='number' class="form-control" name='space_between_rows' onchange='updateEditData(event)' value='${data.space_between_rows || ''}'> ${unitSelectHelper('rows', data.space_between_rows_unit)}</td>`;
  html += `<td scope="row"><input type='number' class="form-control" name='space_between_plants' onchange='updateEditData(event)' value='${data.space_between_plants || ''}'> ${unitSelectHelper('plants', data.space_between_plants_unit)}</td>`;
  html += `<td scope="row">${data.number_of_plants || 0}</td>`;
  html += `<td scope="row">${data.plant_species_count || 0}</td>`;
  html += `<td>`;
  html += `<button onclick='updateOrCreateNestedProperty()' class="btn btn-primary btn-sm">💾</button> `;
  html += `<button onclick='cancelEdit()' class="btn btn-secondary btn-sm">🛑</button> `;
  html += `</td>`;

  return html;
}

const unitSelectHelper = (prop, currentUnit) => {
  html = `<select class="form-control" name="space_between_${prop}_unit" onchange='updateEditData(event)'>`;
  html += `<option value="cm" ${currentUnit == 'cm' ? 'selected' : ''}>Centimetros</option>`;
  html += `<option value="m" ${currentUnit == 'm' ? 'selected' : ''}>Metros</option>`;
  html += `</select>`;
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

const changeToNew = () => {
  generateTableData(dataList);
  const tbody = document.getElementById('nested_productive_properties').getElementsByTagName('tbody')[0];
  let newRow = tbody.insertRow();
  newRow.innerHTML = trEditData({});
}

const cancelEdit = () => {
  generateTableData(dataList);
};

const updateOrCreateNestedProperty = () => {
  const url = dataEdit.id ? `/productive_properties/${dataEdit.id}.json` : `/productive_properties.json`;
  fetch(url, {method: dataEdit.id ? 'PATCH' : 'POST', body: JSON.stringify({productive_property: dataEdit}), headers: {'Content-Type': 'application/json'}})
    .then(response => response.json())
    .then((data) => {
      if (Array.isArray(data.errors) && data.errors.length > 0){
        alert(data.errors.join("\n"));
      }else{
        fethcNestedPropertiesData();
        dataEdit = {};
      }
    });
}

const deleteNestedProperty = (id) => {
  if (!confirm('Confirmar exclusão?')) return;
  const url = `/productive_properties/${id}.json`;
  fetch(url, {method: 'DELETE', headers: {'Content-Type': 'application/json'}})
    .then(response => {
      if (response.status == 204){
        fethcNestedPropertiesData();
      }else{
        alert('Não é possivel remover!');
      }
    })
}

const getDataById = (id) => {
  return dataList.find(data => data.id == id);
}

const businessContactId = document.getElementById('business_contact_id').value;
const maxProductiveProperties = parseInt(document.getElementById('business_contact_max_properties').value);

const addEventToCreateButton = () => {
  const button = document.getElementById('add_new_nested_property_btn');
  button.addEventListener('click', () => {
    if (dataList.length >= maxProductiveProperties){
      alert(`O limite de propriedades produtivas é de ${maxProductiveProperties}`);
    }else{changeToNew();}
  });
}

const init = () => {
  addEventToCreateButton();
  fethcNestedPropertiesData();
}

init();