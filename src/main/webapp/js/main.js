let usuarioLogueado = null; // Nos dirá si hay alguien conectado

function mostrarVista(tipo, pais) {
    // TRUCO PRO: Separamos los días con tildes (para que se vea bonito en el título) 
    // de los días sin tildes (para buscar en la Base de Datos sin que explote)
    const diasPantalla = ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'];
    const diasBD = ['Domingo', 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado'];
    
    const indexDia = new Date().getDay(); 
    const diaPantalla = diasPantalla[indexDia];
    const diaBD = diasBD[indexDia];
    
    document.getElementById('vista-inicio').classList.add('oculto');
    document.getElementById('vista-menu-dia').classList.add('oculto');
    document.getElementById('vista-menu-finde').classList.add('oculto');

    const vistaId = tipo === 'dia' ? 'vista-menu-dia' : 'vista-menu-finde';
    const contenedor = tipo === 'dia' ? document.getElementById('contenedor-platos-dia') : document.getElementById('contenedor-platos-finde');
    
    document.getElementById(vistaId).classList.remove('oculto');
    
    let nombrePaisPantalla = pais;
    if (pais === 'Espana') {
        nombrePaisPantalla = 'España';
    }

    // =========================================================================
    // AQUÍ ESTÁ EL TÍTULO CON EL PRECIO DEL MENÚ DEL DÍA
    // =========================================================================
    let textoSubtitulo = nombrePaisPantalla + ' - ' + diaPantalla;
    if (tipo === 'dia') {
        textoSubtitulo += ' | Precio del menú del día: 20€ (bebidas aparte)';
    }
    document.getElementById(tipo === 'dia' ? 'subtitulo-dia' : 'subtitulo-finde').innerText = textoSubtitulo;
    // =========================================================================

    if (usuarioLogueado !== null) {
        if(document.getElementById('btn-accede')) document.getElementById('btn-accede').style.display = 'none';
        if(document.getElementById('btn-mi-perfil')) document.getElementById('btn-mi-perfil').style.display = 'flex';
        if(document.getElementById('btn-cerrar-sesion')) document.getElementById('btn-cerrar-sesion').style.display = 'none';
        
        if (usuarioLogueado.rol === 'ADMIN') {
            if(document.getElementById('btn-panel-admin')) document.getElementById('btn-panel-admin').style.display = 'flex';
        } else {
            if(document.getElementById('btn-panel-admin')) document.getElementById('btn-panel-admin').style.display = 'none';
        }
    }

    // Llamamos a la API usando el día SIN TILDE (diaBD)
    fetch(`/api/platos?pais=${encodeURIComponent(pais)}&tipo=${tipo}&dia=${encodeURIComponent(diaBD)}`)
    .then(res => res.json())
    .then(platos => {
        contenedor.innerHTML = ""; 
        
        if (platos.length === 0) {
            contenedor.innerHTML = `<p style="width: 100%; text-align: center; padding: 2rem; font-family: 'Raleway', sans-serif;">Aún no tenemos platos disponibles para ${nombrePaisPantalla} hoy (${diaPantalla}). ¡Vuelve pronto!</p>`;
            return;
        }

        platos.forEach(p => {
            // AHORA LAS BEBIDAS SON LO PRIMERO QUE SE MUESTRA AL ENTRAR
            const display = p.categoria === 'bebida' ? 'flex' : 'none';
            
            const precioHTML = p.precio ? `<p style="font-weight: bold; color: #8C3A2A; margin-top: 1rem; font-size: 1.1rem;">${p.precio}</p>` : '';
            const imagenSrc = (p.imagen && p.imagen !== "") ? p.imagen : '../assets/plato.jpg';

            contenedor.innerHTML += `
                <article class="plato ${p.categoria}" style="display: ${display};">
                    <img src="${imagenSrc}" class="img-plato">
                    <div class="info-plato" style="display: flex; flex-direction: column; justify-content: space-between; height: 100%;">
                        <div>
                            <h3>${p.nombre}</h3>
                            <p>${p.descripcion}</p>
                        </div>
                        ${precioHTML}
                    </div>
                </article>
            `;
        });
        
        // Hacemos clic automático en la pestaña "Bebidas"
        const primeraPestana = document.querySelector(`#${vistaId} .tab-pill`);
        if(primeraPestana) primeraPestana.click();
    })
    .catch(error => {
        contenedor.innerHTML = `<p style="width: 100%; text-align: center; padding: 2rem; color: #d9534f;">Error de conexión con la base de datos.</p>`;
    });
}

function volverInicio() {
    document.getElementById('vista-inicio').classList.remove('oculto');
    
    document.getElementById('vista-menu-dia').classList.add('oculto');
    document.getElementById('vista-menu-finde').classList.add('oculto');
    
    if(document.getElementById('vista-acceso')) {
        document.getElementById('vista-acceso').classList.add('oculto');
    }
    if(document.getElementById('vista-perfil')) {
        document.getElementById('vista-perfil').classList.add('oculto');
    }

    if (usuarioLogueado !== null) {
        if(document.getElementById('btn-accede')) document.getElementById('btn-accede').style.display = 'none';
        if(document.getElementById('btn-mi-perfil')) document.getElementById('btn-mi-perfil').style.display = 'flex';
        if(document.getElementById('btn-cerrar-sesion')) document.getElementById('btn-cerrar-sesion').style.display = 'none';
        
        if (usuarioLogueado.rol === 'ADMIN') {
            if(document.getElementById('btn-panel-admin')) document.getElementById('btn-panel-admin').style.display = 'flex';
        } else {
            if(document.getElementById('btn-panel-admin')) document.getElementById('btn-panel-admin').style.display = 'none';
        }
    } else {
        if(document.getElementById('btn-accede')) document.getElementById('btn-accede').style.display = 'flex';
        if(document.getElementById('btn-mi-perfil')) document.getElementById('btn-mi-perfil').style.display = 'none';
        if(document.getElementById('btn-cerrar-sesion')) document.getElementById('btn-cerrar-sesion').style.display = 'none';
        
        if(document.getElementById('btn-panel-admin')) document.getElementById('btn-panel-admin').style.display = 'none';
    }
}

function mostrarPlatos(categoria, boton, menuId) {
    const menu = document.getElementById(menuId);
    
    menu.querySelectorAll('.tab-pill').forEach(btn => btn.classList.remove('activo'));
    boton.classList.add('activo');

    menu.querySelectorAll('.plato').forEach(p => p.style.display = 'none');
    menu.querySelectorAll('.' + categoria).forEach(p => p.style.display = 'flex');
}

function mostrarAcceso() {
    if (usuarioLogueado !== null) {
        mostrarPerfil();
        return;
    }

    document.getElementById('vista-inicio').classList.add('oculto');
    if(document.getElementById('vista-menu-dia')) document.getElementById('vista-menu-dia').classList.add('oculto');
    if(document.getElementById('vista-menu-finde')) document.getElementById('vista-menu-finde').classList.add('oculto');
    if(document.getElementById('vista-perfil')) document.getElementById('vista-perfil').classList.add('oculto');
    
    document.getElementById('vista-acceso').classList.remove('oculto');
    cambiarModoAcceso('login');
}

function cambiarModoAcceso(modo) {
    const cajaLogin = document.getElementById('caja-login');
    const cajaRegistro = document.getElementById('caja-registro');

    if (modo === 'registro') {
        cajaLogin.classList.add('oculto');
        cajaRegistro.classList.remove('oculto');
    } else {
        cajaRegistro.classList.add('oculto');
        cajaLogin.classList.remove('oculto');
    }
}

function mostrarPerfil() {
    document.querySelectorAll('main, section').forEach(s => s.classList.add('oculto'));
    document.getElementById('vista-perfil').classList.remove('oculto');

    document.getElementById('btn-accede').style.display = 'none';
    document.getElementById('btn-mi-perfil').style.display = 'none';
    document.getElementById('btn-cerrar-sesion').style.display = 'flex';

    if (usuarioLogueado !== null && usuarioLogueado.rol === 'ADMIN') {
        if(document.getElementById('btn-panel-admin')) document.getElementById('btn-panel-admin').style.display = 'flex';
    } else {
        if(document.getElementById('btn-panel-admin')) document.getElementById('btn-panel-admin').style.display = 'none';
    }
}

let visitas = 5;
function simularVisita() {
    if (visitas < 10) {
        visitas++;
        document.getElementById('num-visitas').innerText = visitas;
        document.getElementById('barra-color').style.width = (visitas * 10) + '%';
        
        if (visitas === 10) {
            alert("¡Enhorabuena! Has completado tus 10 visitas. Tu próxima comida es gratis.");
        }
    }
}

function registrarUsuarioFetch() {
    const nombre = document.getElementById('reg-nombre').value;
    const email = document.getElementById('reg-email').value;
    const password = document.getElementById('reg-password').value;

    const usuario = { nombre: nombre, email: email, password: password };

    fetch('/api/registro', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(usuario)
    })
    .then(response => {
        if (!response.ok) throw new Error('Error en la BD');
        return response.json();
    })
    .then(data => {
        alert('Registro completado. Iniciando sesión automáticamente...');
        document.getElementById('login-email').value = email;
        document.getElementById('login-password').value = password;
        iniciarSesionFetch(); 
    })
    .catch(error => {
        alert('Fallo en el registro. Revisa los datos.');
    });
}

function iniciarSesionFetch() {
    const email = document.getElementById('login-email').value;
    const password = document.getElementById('login-password').value;

    const credenciales = { email: email, password: password };

    fetch('/api/login', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(credenciales)
    })
    .then(response => {
        if (!response.ok) throw new Error('Credenciales incorrectas');
        return response.json();
    })
    .then(usuario => {
        usuarioLogueado = usuario; 
        localStorage.setItem('usuarioSesion', JSON.stringify(usuario));
        
        if (usuario.rol === 'ADMIN') {
            window.location.href = 'admin.html';
        } else {
            document.getElementById('email-usuario-perfil').innerText = usuario.email;
            document.getElementById('dato-email').innerText = usuario.email;
            document.getElementById('dato-nombre').innerText = usuario.nombre;
            
            visitas = usuario.visitas;
            document.getElementById('num-visitas').innerText = visitas;
            document.getElementById('barra-color').style.width = (visitas * 10) + '%';
            
            mostrarPerfil();
        }
    })
    .catch(error => {
        alert('Error al iniciar sesión: Revisa tu correo y contraseña.');
    });
}

function actualizarPasswordFetch() {
    const email = document.getElementById('dato-email').innerText;
    const nuevaPassword = prompt("Introduce tu nueva contraseña:");

    if (nuevaPassword) {
        fetch('/api/actualizar', {
            method: 'PUT',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ email: email, password: nuevaPassword })
        })
        .then(response => {
            if (!response.ok) throw new Error('Error al actualizar');
            return response.json();
        })
        .then(data => alert('Contraseña actualizada con éxito'))
        .catch(error => alert('Hubo un error al cambiar la contraseña'));
    }
}

function borrarCuentaFetch() {
    const email = document.getElementById('dato-email').innerText;
    
    if (confirm("¿Estás seguro de que quieres borrar tu cuenta? Esta acción no se puede deshacer.")) {
        fetch('/api/borrar', {
            method: 'DELETE',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ email: email })
        })
        .then(response => {
            if (!response.ok) throw new Error('Error al borrar');
            return response.json();
        })
        .then(data => {
            alert('Cuenta borrada con éxito');
            cerrarSesion(); 
        })
        .catch(error => alert('Hubo un error al borrar la cuenta'));
    }
}

function togglePassword(inputId) {
    const input = document.getElementById(inputId);
    if (input.type === "password") {
        input.type = "text";
    } else {
        input.type = "password";
    }
}

function cerrarSesion() {
    const loginEmail = document.getElementById('login-email');
    const loginPassword = document.getElementById('login-password');

    if (loginEmail) loginEmail.value = '';
    if (loginPassword) loginPassword.value = '';

    usuarioLogueado = null; 
    localStorage.removeItem('usuarioSesion'); 

    if(document.getElementById('btn-panel-admin')) document.getElementById('btn-panel-admin').style.display = 'none';

    alert("Sesión cerrada correctamente."); 

    if (!window.location.pathname.endsWith('index.html')) {
        window.location.href = 'index.html';
    } else {
        volverInicio(); 
    }
}

// --- LÓGICA DEL CALENDARIO PERSONALIZADO Y HORAS ---

let mesActualCalendario = new Date().getMonth();
let anoActualCalendario = new Date().getFullYear();
let fechaSeleccionada = null;

const nombresMeses = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];

function configurarFormularioReservas() {
    const selectHora = document.getElementById('reserva-hora');

    if (selectHora) {
        selectHora.innerHTML = '<option value="" disabled selected>Hora...</option>';
        for (let i = 13; i <= 23; i++) {
            selectHora.innerHTML += `<option value="${i}:00">${i}:00</option>`;
            selectHora.innerHTML += `<option value="${i}:30">${i}:30</option>`;
        }
        selectHora.innerHTML += `<option value="00:00">00:00</option>`;
    }

    if (document.getElementById('calendar-days')) {
        renderizarCalendario();
        
        document.addEventListener('click', function(event) {
            const container = document.querySelector('.custom-datepicker-container');
            const dropdown = document.getElementById('calendar-dropdown');
            if (container && !container.contains(event.target) && !dropdown.classList.contains('oculto')) {
                dropdown.classList.add('oculto');
            }
        });
    }
}

function toggleCalendario() {
    document.getElementById('calendar-dropdown').classList.toggle('oculto');
}

function cambiarMes(direccion) {
    mesActualCalendario += direccion;
    if (mesActualCalendario < 0) {
        mesActualCalendario = 11;
        anoActualCalendario--;
    } else if (mesActualCalendario > 11) {
        mesActualCalendario = 0;
        anoActualCalendario++;
    }
    renderizarCalendario();
}

function renderizarCalendario() {
    const gridDias = document.getElementById('calendar-days');
    const textoMesAno = document.getElementById('calendar-month-year');
    if (!gridDias) return;

    gridDias.innerHTML = '';
    textoMesAno.innerText = `${nombresMeses[mesActualCalendario]} ${anoActualCalendario}`;

    const primerDiaMes = new Date(anoActualCalendario, mesActualCalendario, 1).getDay();
    const diasEnMes = new Date(anoActualCalendario, mesActualCalendario + 1, 0).getDate();

    let primerDiaGrid = primerDiaMes === 0 ? 6 : primerDiaMes - 1;

    const hoy = new Date();
    hoy.setHours(0,0,0,0);

    for (let i = 0; i < primerDiaGrid; i++) {
        const divEmpty = document.createElement('div');
        divEmpty.classList.add('calendar-day', 'empty');
        gridDias.appendChild(divEmpty);
    }

    for (let i = 1; i <= diasEnMes; i++) {
        const diaDiv = document.createElement('div');
        diaDiv.classList.add('calendar-day');
        diaDiv.innerText = i;

        const fechaIteracion = new Date(anoActualCalendario, mesActualCalendario, i);
        fechaIteracion.setHours(0,0,0,0);

        if (fechaIteracion < hoy) {
            diaDiv.classList.add('disabled');
        } else {
            diaDiv.onclick = () => seleccionarFecha(i, mesActualCalendario, anoActualCalendario);
            if (fechaIteracion.getTime() === hoy.getTime()) diaDiv.classList.add('today');
            if (fechaSeleccionada && fechaSeleccionada.getTime() === fechaIteracion.getTime()) {
                diaDiv.classList.add('selected');
            }
        }
        gridDias.appendChild(diaDiv);
    }
}

function seleccionarFecha(dia, mes, ano) {
    fechaSeleccionada = new Date(ano, mes, dia);
    
    const textoMostrar = `${dia} ${nombresMeses[mes]} ${ano}`;
    document.getElementById('reserva-fecha-texto').value = textoMostrar;
    
    const mesFormat = String(mes + 1).padStart(2, '0');
    const diaFormat = String(dia).padStart(2, '0');
    document.getElementById('reserva-fecha').value = `${ano}-${mesFormat}-${diaFormat}`;
    
    toggleCalendario();
    renderizarCalendario();
}

function enviarReserva(event) {
    event.preventDefault(); 

    const restaurante = document.getElementById('restaurante').value;
    const nombre = document.getElementById('nombre').value;
    const email = document.getElementById('email').value;
    const comensales = document.getElementById('comensales').value;
    const fecha = document.getElementById('reserva-fecha').value;
    const hora = document.getElementById('reserva-hora').value;

    if (!fecha || !hora) {
        alert("Por favor, selecciona una fecha y una hora.");
        return;
    }

    const reservaData = {
        restaurante: restaurante,
        nombre: nombre,
        email: email,
        comensales: parseInt(comensales),
        fecha_hora: fecha + " " + hora + ":00" 
    };

    fetch('/api/reservar', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(reservaData)
    })
    .then(response => {
        if (!response.ok) throw new Error('Error en la base de datos');
        
        alert(`¡Reserva confirmada con éxito!\n\nTe esperamos en la sala de ${restaurante} el día ${fecha} a las ${hora}.`);
        
        document.getElementById('form-reserva').reset();
        document.getElementById('reserva-fecha-texto').value = '';
        window.location.href = "index.html";
    })
    .catch(error => {
        alert("Hubo un problema al procesar tu reserva. Asegúrate de estar registrado con ese correo.");
    });
}

document.addEventListener('DOMContentLoaded', () => {
    
    if (typeof configurarFormularioReservas === "function") {
        configurarFormularioReservas();
    }

    const sesionGuardada = localStorage.getItem('usuarioSesion');
    if (sesionGuardada) {
        usuarioLogueado = JSON.parse(sesionGuardada);
        
        const btnAccede = document.getElementById('btn-accede');
        const btnMiPerfil = document.getElementById('btn-mi-perfil');
        const btnCerrarSesion = document.getElementById('btn-cerrar-sesion');
        const btnPanelAdmin = document.getElementById('btn-panel-admin');
        
        if (btnAccede) btnAccede.style.display = 'none';
        if (btnMiPerfil) btnMiPerfil.style.display = 'flex';

        if (usuarioLogueado.rol === 'ADMIN' && btnPanelAdmin) {
            btnPanelAdmin.style.display = 'flex';
        }
        
        if (window.location.pathname.includes('reservas.html') && btnCerrarSesion) {
            btnCerrarSesion.style.display = 'none';
        }
    }

    const parametros = new URLSearchParams(window.location.search);
    if (parametros.get('login') === 'true' && !usuarioLogueado) {
        if (typeof mostrarAcceso === "function") mostrarAcceso();
        window.history.replaceState({}, document.title, "index.html");
    } else if (parametros.get('perfil') === 'true' || (parametros.get('login') === 'true' && usuarioLogueado)) {
        if (typeof mostrarPerfil === "function") mostrarPerfil();
        window.history.replaceState({}, document.title, "index.html");
    }
});