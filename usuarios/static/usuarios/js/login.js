    function switchTab(tab, btn) {
      document.querySelectorAll('.tab').forEach(t => t.classList.remove('active'));
      document.querySelectorAll('.form-section').forEach(s => s.classList.remove('active'));
      btn.classList.add('active');
      document.getElementById('tab-' + tab).classList.add('active');
    }

    // --- Validación de formularios en JS (sin alert) ---

    function isValidEmail(value) {
      return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value);
    }

    function showFieldError(input, message) {
      var errorEl = document.getElementById('err-' + input.id);
      input.classList.add('invalid');
      errorEl.textContent = message;
      errorEl.classList.add('show');
    }

    function clearFieldError(input) {
      var errorEl = document.getElementById('err-' + input.id);
      input.classList.remove('invalid');
      errorEl.textContent = '';
      errorEl.classList.remove('show');
    }

    function setupLiveClear(inputs) {
      inputs.forEach(function (input) {
        input.addEventListener('input', function () {
          clearFieldError(input);
        });
      });
    }

    // Formulario de LOGIN
    var loginForm = document.getElementById('form-login');
    var loginUsername = document.getElementById('login-username');
    var loginPassword = document.getElementById('login-password');

    loginForm.addEventListener('submit', function (event) {
      var isValid = true;

      if (loginUsername.value.trim() === '') {
        showFieldError(loginUsername, 'El email es obligatorio.');
        isValid = false;
      } else if (!isValidEmail(loginUsername.value.trim())) {
        showFieldError(loginUsername, 'Ingresa un email con formato válido.');
        isValid = false;
      } else {
        clearFieldError(loginUsername);
      }

      if (loginPassword.value === '') {
        showFieldError(loginPassword, 'La contraseña es obligatoria.');
        isValid = false;
      } else {
        clearFieldError(loginPassword);
      }

      if (!isValid) {
        event.preventDefault();
      }
    });

    setupLiveClear([loginUsername, loginPassword]);

    // Formulario de REGISTRO
    var regForm = document.getElementById('form-register');
    var regName = document.getElementById('reg-name');
    var regEmail = document.getElementById('reg-email');
    var regUsername = document.getElementById('reg-username');
    var regPassword1 = document.getElementById('reg-password1');
    var regPassword2 = document.getElementById('reg-password2');

    regForm.addEventListener('submit', function (event) {
      var isValid = true;

      if (regName.value.trim() === '') {
        showFieldError(regName, 'El nombre es obligatorio.');
        isValid = false;
      } else {
        clearFieldError(regName);
      }

      if (regEmail.value.trim() === '') {
        showFieldError(regEmail, 'El email es obligatorio.');
        isValid = false;
      } else if (!isValidEmail(regEmail.value.trim())) {
        showFieldError(regEmail, 'Ingresa un email con formato válido.');
        isValid = false;
      } else {
        clearFieldError(regEmail);
      }

      if (regUsername.value.trim() === '') {
        showFieldError(regUsername, 'El nombre de usuario es obligatorio.');
        isValid = false;
      } else {
        clearFieldError(regUsername);
      }

      if (regPassword1.value === '') {
        showFieldError(regPassword1, 'La contraseña es obligatoria.');
        isValid = false;
      } else if (regPassword1.value.length < 8) {
        showFieldError(regPassword1, 'La contraseña debe tener al menos 8 caracteres.');
        isValid = false;
      } else {
        clearFieldError(regPassword1);
      }

      if (regPassword2.value === '') {
        showFieldError(regPassword2, 'Debes confirmar la contraseña.');
        isValid = false;
      } else if (regPassword2.value !== regPassword1.value) {
        showFieldError(regPassword2, 'Las contraseñas no coinciden.');
        isValid = false;
      } else {
        clearFieldError(regPassword2);
      }

      if (!isValid) {
        event.preventDefault();
      }
    });

    setupLiveClear([regName, regEmail, regUsername, regPassword1, regPassword2]);