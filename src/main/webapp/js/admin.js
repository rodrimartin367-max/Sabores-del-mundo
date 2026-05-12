document.addEventListener('DOMContentLoaded', cargarUsuarios);

function cargarUsuarios() {
    fetch('/api/usuarios/todos')
    .then(res => res.ok ? res.json() : Promise.reject("Error"))
    .then(usuarios => {
        const contenedor = document.getElementById('contenedor-tabla-usuarios');
        if (usuarios.length === 0) return contenedor.innerHTML = '<p>No hay usuarios registrados.</p>';

        let tablaHTML = `
            <table class="tabla-admin">
                <thead>
                    <tr><th>ID</th><th>Nombre</th><th>Email</th><th>Rol</th><th class="centro">Acciones</th></tr>
                </thead>
                <tbody>
        `;

        usuarios.forEach(u => {
            const claseRol = u.rol === 'ADMIN' ? 'badge-admin' : 'badge-user';
            tablaHTML += `
                <tr>
                    <td>${u.id}</td>
                    <td>${u.nombre}</td>
                    <td>${u.email}</td>
                    <td><span class="badge-rol ${claseRol}">${u.rol}</span></td>
                    <td class="acciones-tabla">
                        <button class="btn btn-reserva" onclick="verReservasUsuario(${u.id}, '${u.nombre}')">Ver Reservas</button>
                        <button class="btn btn-reserva" onclick="eliminarUsuarioAdmin('${u.email}')">Eliminar</button>
                    </td>
                </tr>
            `;
        });

        contenedor.innerHTML = tablaHTML + '</tbody></table>';
    })
    .catch(() => {
        document.getElementById('contenedor-tabla-usuarios').innerHTML = '<p class="error-texto">Error al cargar usuarios.</p>';
    });
}

// Recibimos el ID como número
function verReservasUsuario(idUsuario, nombreUsuario) {
    const panelReservas = document.getElementById('panel-reservas-admin');
    const contenedor = document.getElementById('contenedor-reservas-usuario');
    
    panelReservas.classList.remove('oculto');
    document.querySelector('#panel-reservas-admin h2').innerText = "Reservas de " + nombreUsuario;
    contenedor.innerHTML = '<p>Buscando reservas en la base de datos...</p>';

    // Hacemos el fetch pasando el ?id=
    fetch('/api/reservas/usuario?id=' + idUsuario)
    .then(res => res.ok ? res.json() : Promise.reject("Error"))
    .then(reservas => {
        if (reservas.length === 0) {
            contenedor.innerHTML = '<p>Este usuario no ha hecho ninguna reserva todavía.</p>';
            return;
        }

        let tablaHTML = `
            <table class="tabla-admin">
                <thead>
                    <tr>
                        <th>Restaurante (País)</th>
                        <th>Comensales</th>
                        <th>Fecha y Hora</th>
                        <th class="centro">Acciones</th>
                    </tr>
                </thead>
                <tbody>
        `;

        reservas.forEach(r => {
            tablaHTML += `
                <tr>
                    <td>${r.restaurante}</td>
                    <td>${r.comensales} personas</td>
                    <td>${r.fecha_hora}</td>
                    <td class="acciones-tabla">
                        <button class="btn btn-reserva" onclick="eliminarReservaAdmin(${r.id}, ${idUsuario}, '${nombreUsuario}')">Eliminar</button>
                    </td>
                </tr>
            `;
        });

        contenedor.innerHTML = tablaHTML + '</tbody></table>';
    })
    .catch(() => {
        contenedor.innerHTML = '<p class="error-texto">Error al cargar las reservas.</p>';
    });
}

function eliminarReservaAdmin(idReserva, idUsuario, nombreUsuario) {
    if (confirm("¿Estás seguro de que quieres eliminar esta reserva?")) {
        // Pasamos el ID por la URL, es la forma más segura para peticiones DELETE
        fetch('/api/reservas/borrar?id=' + idReserva, {
            method: 'DELETE'
        })
        .then(response => {
            if (!response.ok) throw new Error('Error al borrar reserva');
            alert('Reserva eliminada correctamente.');
            // Volvemos a cargar las reservas automáticamente
            verReservasUsuario(idUsuario, nombreUsuario);
        })
        .catch(error => alert('Hubo un error al eliminar la reserva.'));
    }
}

function ocultarPanelReservas() { 
    document.getElementById('panel-reservas-admin').classList.add('oculto'); 
}
let tablaHTML = `
            <table class="tabla-admin">
                <thead>
                    <tr>
                        <th>Restaurante (País)</th>
                        <th>Comensales</th>
                        <th>Fecha y Hora</th>
                        <th class="centro">Acciones</th>
                    </tr>
                </thead>
                <tbody>
        `;

        reservas.forEach(r => {
            tablaHTML += `
                <tr>
                    <td>${r.restaurante}</td>
                    <td>${r.comensales} personas</td>
                    <td>${r.fecha_hora}</td>
                    <td class="acciones-tabla">
                        <button class="btn btn-reserva" onclick="eliminarReservaAdmin(${r.id}, ${idUsuario}, '${nombreUsuario}')">Eliminar</button>
                    </td>
                </tr>
            `;
        });

        function eliminarUsuarioAdmin(emailUsuario) {
    if (confirm(`¿Estás seguro de que quieres eliminar al usuario ${emailUsuario}?\n\nATENCIÓN: Se borrarán también todas sus reservas del sistema.`)) {
        
        // Pasamos el email por la URL para que no falle el método DELETE
        fetch('/api/admin/borrar-usuario?email=' + encodeURIComponent(emailUsuario), {
            method: 'DELETE'
        })
        .then(response => {
            if (!response.ok) throw new Error('Error al borrar usuario');
            
            alert('Usuario y sus reservas eliminados correctamente.');
            
            // Recargamos la tabla de usuarios automáticamente
            cargarUsuarios();
            
            // Si el panel de reservas de ese usuario estaba abierto, lo cerramos
            const panelReservas = document.getElementById('panel-reservas-admin');
            if (panelReservas) {
                panelReservas.classList.add('oculto');
            }
        })
        .catch(error => {
            alert('Hubo un error al eliminar el usuario. Revisa la consola del servidor.');
        });
    }
}