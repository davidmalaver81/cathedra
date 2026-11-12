const $=id=>document.getElementById(id);
const I={
  ck:'<svg class="i ck" viewBox="0 0 24 24"><circle cx="12" cy="12" r="10"/><path d="M8 12l3 3 5-6"/></svg>',
  h:'<svg class="i" viewBox="0 0 24 24"><path d="M20.8 4.6a5.5 5.5 0 0 0-7.8 0L12 5.7l-1-1.1a5.5 5.5 0 0 0-7.8 7.8l1 1.1L12 21l7.8-7.5 1-1.1a5.5 5.5 0 0 0 0-7.8z"/></svg>',
  s:'<svg class="i" viewBox="0 0 24 24"><circle cx="18" cy="5" r="3"/><circle cx="6" cy="12" r="3"/><circle cx="18" cy="19" r="3"/><path d="M8.6 13.5l6.8 4M15.4 6.5l-6.8 4"/></svg>'
};
const B=[
{id:1,t:'Beca Excelencia Académica',o:'Universidad Nacional de Colombia',c:'Bogotá, Colombia',p:'Colombia',lv:'Pregrado',cv:'Total',cp:'100% de la matrícula',ty:'Mérito',m:'Presencial',dl:12,ago:2,d:'Dirigida a estudiantes con desempeño sobresaliente que quieran cursar su carrera sin costo de matrícula durante toda su formación.',r:['Promedio acumulado superior a 4.5','Carta de motivación','Admisión vigente a un programa de pregrado']},
{id:2,t:'Beca Talento Deportivo',o:'Universidad de Antioquia',c:'Medellín, Colombia',p:'Colombia',lv:'Pregrado',cv:'Parcial',cp:'50% de la matrícula',ty:'Deportiva',m:'Presencial',dl:20,ago:30,d:'Apoya a deportistas de alto rendimiento para que combinen su carrera deportiva con la formación universitaria.',r:['Aval de su federación o liga','Resultados deportivos de los últimos 2 años','Disponibilidad para representar a la universidad']},
{id:3,t:'Beca Movilidad Erasmus+',o:'Convenio Unión Europea',c:'Madrid, España',p:'España',lv:'Intercambio',cv:'Total',cp:'Matrícula + manutención mensual',ty:'Internacional',m:'Presencial',dl:45,ago:50,d:'Un semestre de intercambio en universidades europeas aliadas, con cobertura completa y apoyo económico mensual.',r:['Haber aprobado el 50% del plan de estudios','Nivel B2 de inglés','Aval de la oficina de relaciones internacionales']},
{id:4,t:'Maestría en Ciencias de Datos',o:'Programa DAAD',c:'Berlín, Alemania',p:'Alemania',lv:'Posgrado',cv:'Total',cp:'Matrícula + estipendio',ty:'Internacional',m:'Presencial',dl:60,ago:72,d:'Financia estudios de maestría en universidades alemanas para profesionales con interés en investigación aplicada.',r:['Título profesional en ingeniería o afines','Certificación de inglés vigente','Dos cartas de recomendación']},
{id:5,t:'Beca Apoyo Socioeconómico',o:'Universidad de San Buenaventura',c:'Bogotá, Colombia',p:'Colombia',lv:'Pregrado',cv:'Parcial',cp:'70% de la matrícula',ty:'Necesidad económica',m:'Presencial y virtual',dl:8,ago:5,d:'Acompaña a estudiantes que demuestran dificultad económica para continuar o iniciar sus estudios de pregrado.',r:['Certificado de estrato o ingresos familiares','Estudio socioeconómico','Promedio mínimo de 3.8']},
{id:6,t:'Beca Doctoral Ciencia e Innovación',o:'Ministerio de Ciencia',c:'Bogotá, Colombia',p:'Colombia',lv:'Posgrado',cv:'Total',cp:'Matrícula + sostenimiento',ty:'Mérito',m:'Presencial y remoto',dl:30,ago:96,d:'Impulsa a nuevos investigadores a cursar un doctorado en áreas estratégicas para el desarrollo del país.',r:['Título de maestría','Propuesta de investigación','Carta de aceptación del grupo de investigación']}
];
const K=[['f-lv','lv'],['f-pa','p'],['f-cv','cv'],['f-ty','ty']];
const saved=new Set(),applied=new Set(),seen=new Set();
let sel=null,alerted=false;
const when=h=>h<24?`Hace ${h} horas`:`Hace ${Math.round(h/24)} días`;

K.forEach(([id,k])=>{
  const s=$(id);
  s.innerHTML=`<option value="">${s.dataset.l}</option>`+[...new Set(B.map(b=>b[k]))].map(v=>`<option>${v}</option>`).join('');
});

function render(){
  const q=$('q').value.toLowerCase().trim(),loc=$('loc').value.toLowerCase().trim();
  const L=B.filter(b=>(!q||(b.t+' '+b.o).toLowerCase().includes(q))&&(!loc||b.c.toLowerCase().includes(loc))&&K.every(([id,k])=>!$(id).value||b[k]===$(id).value));
  L.sort($('f-sort').value==='dl'?(a,b)=>a.dl-b.dl:(a,b)=>a.ago-b.ago);
  $('count').innerHTML=`<b>${L.length}</b> becas disponibles`;
  if(!L.some(b=>b.id===sel))sel=L.length?L[0].id:null;
  $('cards').innerHTML=L.length?L.map(b=>`<article class="card${b.id===sel?' on':''}" data-id="${b.id}">
    ${saved.has(b.id)?`<span class="sv">${I.h}</span>`:''}
    <h3>${b.t}</h3><div class="org">${I.ck}${b.o}</div><div>${b.c}</div>
    <div class="meta">${b.cp} · ${b.m}</div>
    <div class="foot"><span>${when(b.ago)} · cierra en ${b.dl} días</span>${seen.has(b.id)?'<span class="tag">Vista</span>':''}</div></article>`).join(''):'<div class="empty">No hay becas con esos criterios.</div>';
  detail(L.find(b=>b.id===sel));
}

function detail(b){
  const el=$('detail');
  if(!b){el.innerHTML='<div class="empty">Ajusta los filtros para ver resultados.</div>';return;}
  el.innerHTML=`<button class="back" type="button">← Volver a la lista</button>
    <h2>${b.t}</h2>
    <div class="org">${I.ck}${b.o} · Convocatoria verificada</div><div>${b.c}</div>
    <div class="acts">
      <button class="apply${applied.has(b.id)?' done':''}" data-a="apply" type="button">${applied.has(b.id)?'Postulación enviada ✓':'Postularme'}</button>
      <button class="ico${saved.has(b.id)?' on':''}" data-a="save" type="button" aria-label="Guardar">${I.h}</button>
      <button class="ico" data-a="share" type="button" aria-label="Compartir">${I.s}</button>
    </div>
    <h4>Resumen</h4>
    <ul class="rows"><li><b>Cobertura</b>${b.cp}</li><li><b>Nivel</b>${b.lv}</li><li><b>Tipo</b>${b.ty}</li><li><b>Modalidad</b>${b.m}</li><li><b>Cierre</b>En ${b.dl} días</li></ul>
    <h4>Descripción de la beca</h4><p>${b.d}</p>
    <h4 style="margin-top:24px">Requisitos</h4><ul class="req">${b.r.map(x=>`<li>${x}</li>`).join('')}</ul>`;
}

$('cards').addEventListener('click',e=>{
  const c=e.target.closest('.card');if(!c)return;
  sel=+c.dataset.id;seen.add(sel);render();
  if(matchMedia('(max-width:900px)').matches)$('detail').classList.add('open');
});
$('detail').addEventListener('click',e=>{
  if(e.target.closest('.back'))return $('detail').classList.remove('open');
  const a=e.target.closest('[data-a]');if(!a)return;
  const f=a.dataset.a,s=f==='apply'?applied:saved;
  if(f==='share'){a.classList.toggle('on');return;}
  s.has(sel)?s.delete(sel):s.add(sel);
  const open=$('detail').classList.contains('open');render();
  if(open)$('detail').classList.add('open');
});
$('alert').addEventListener('click',e=>{alerted=!alerted;e.target.textContent=alerted?'Alerta creada ✓':'Crear alerta';});
['q','loc'].forEach(id=>$(id).addEventListener('input',render));
['f-sort',...K.map(k=>k[0])].forEach(id=>$(id).addEventListener('change',render));
render();
