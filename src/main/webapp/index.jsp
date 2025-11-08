<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Simple Registration</title>
  <style>
    :root{
      --bg:#f4f6fb;
      --card:#ffffff;
      --primary:#3b82f6;
      --muted:#6b7280;
      --danger:#ef4444;
      font-family: Inter, system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial;
    }
    *{box-sizing:border-box}
    body{
      margin:0;
      background:linear-gradient(180deg, var(--bg), #eef2ff);
      min-height:100vh;
      display:flex;
      align-items:center;
      justify-content:center;
      padding:32px;
    }

    .card{
      width:100%;
      max-width:480px;
      background:var(--card);
      border-radius:12px;
      padding:28px;
      box-shadow:0 10px 30px rgba(15,23,42,0.08);
      border:1px solid rgba(15,23,42,0.04);
    }

    h1{
      margin:0 0 8px 0;
      font-size:20px;
      letter-spacing:-0.2px;
    }
    p.lead{
      margin:0 0 20px 0;
      color:var(--muted);
      font-size:14px;
    }

    form {
      display:grid;
      gap:12px;
    }

    .row{display:flex; gap:12px;}
    .row > *{flex:1;}

    label{
      display:block;
      font-size:13px;
      color:var(--muted);
      margin-bottom:6px;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"],
    input[type="tel"],
    select {
      width:100%;
      padding:10px 12px;
      border-radius:8px;
      border:1px solid #e6e9ef;
      background:transparent;
      font-size:14px;
      outline:none;
      transition:box-shadow .12s, border-color .12s;
    }
    input:focus, select:focus{
      border-color:rgba(59,130,246,0.9);
      box-shadow:0 6px 18px rgba(59,130,246,0.08);
    }

    .small{
      font-size:12px;
      color:var(--muted);
      margin-top:6px;
    }

    .actions{
      display:flex;
      justify-content:space-between;
      align-items:center;
      gap:12px;
      margin-top:6px;
    }

    button {
      background:var(--primary);
      color:white;
      border:0;
      padding:10px 14px;
      border-radius:10px;
      font-weight:600;
      cursor:pointer;
      font-size:14px;
    }
    button[disabled]{
      opacity:0.6;
      cursor:not-allowed;
    }

    .alt{
      background:transparent;
      color:var(--muted);
      border:1px solid #eef2ff;
      padding:8px 12px;
      border-radius:10px;
      font-size:14px;
    }

    .note {
      border-left:3px solid #e6eefc;
      padding:10px 12px;
      background:#fbfdff;
      color:var(--muted);
      font-size:13px;
      border-radius:8px;
    }

    /* Responsive */
    @media (max-width:420px){
      .card{padding:18px}
      .row{flex-direction:column}
    }

    /* simple visual error hint using :invalid (works for inputs with required/pattern) */
    input:invalid{
      border-color:var(--danger);
      box-shadow:0 6px 14px rgba(239,68,68,0.06);
    }
  </style>
</head>
<body>
  <main class="card" role="main" aria-labelledby="signup-title">
    <h1 id="signup-title">Create an account</h1>
    <p class="lead">A tiny signup form using only HTML5 validation (no JavaScript).</p>

    <form action="#" method="post" novalidate>
      <!-- Name -->
      <div>
        <label for="fullname">Full name</label>
        <input id="fullname" name="fullname" type="text" placeholder="e.g. Priya Sharma" required
               minlength="2" maxlength="60" autocomplete="name" />
        <div class="small">Enter your first and last name.</div>
      </div>

      <!-- Email and Phone row -->
      <div class="row">
        <div>
          <label for="email">Email</label>
          <input id="email" name="email" type="email" placeholder="you@example.com" required autocomplete="email" />
        </div>

        <div>
          <label for="phone">Phone</label>
          <input id="phone" name="phone" type="tel" placeholder="+91 98765 43210"
                 pattern="^\+?\d{7,15}$" title="Enter country code + number (digits only)" autocomplete="tel" />
          <div class="small">Optional — include country code if available.</div>
        </div>
      </div>

      <!-- Username -->
      <div>
        <label for="username">Username</label>
        <input id="username" name="username" type="text" placeholder="username123" required
               pattern="^[A-Za-z0-9_.-]{3,20}$" title="3–20 characters: letters, numbers, . _ -" autocomplete="username" />
      </div>

      <!-- Password and confirm -->
      <div class="row">
        <div>
          <label for="password">Password</label>
          <input id="password" name="password" type="password" placeholder="At least 8 characters" required
                 minlength="8" autocomplete="new-password" />
        </div>
        <div>
          <label for="confirm">Confirm password</label>
          <!-- Without JS we can't compare; but we can hint the pattern to match common rules -->
          <input id="confirm" name="confirm" type="password" placeholder="Retype password" required minlength="8" autocomplete="new-password" />
        </div>
      </div>

      <!-- Gender & Country -->
      <div class="row">
        <div>
          <label for="gender">Gender</label>
          <select id="gender" name="gender" required>
            <option value="">Select</option>
            <option>Female</option>
            <option>Male</option>
            <option>Non-binary</option>
            <option>Prefer not to say</option>
          </select>
        </div>
        <div>
          <label for="country">Country</label>
          <select id="country" name="country" required>
            <option value="">Select</option>
            <option>India</option>
            <option>United States</option>
            <option>United Kingdom</option>
            <option>Canada</option>
            <option>Other</option>
          </select>
        </div>
      </div>

      <!-- Terms -->
      <div>
        <label style="display:flex; gap:10px; align-items:center; font-weight:normal;">
          <input type="checkbox" id="terms" name="terms" required />
          <span>I agree to the <a href="#" aria-label="Terms and Conditions">terms &amp; privacy</a>.</span>
        </label>
      </div>

      <!-- Actions -->
      <div class="actions">
        <button type="submit">Sign up</button>
        <button type="reset" class="alt">Reset</button>
      </div>

      <div style="margin-top:12px; display:flex; gap:12px; align-items:center;">
        <div class="note" style="flex:1;">
          Tip: HTML5 will prevent submit if required fields are empty or patterns don't match.
        </div>
      </div>
    </form>
  </main>
</body>
</html>
