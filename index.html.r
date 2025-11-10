<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>NYPADROX Online Chat</title>
<style>
:root{
  --bg:#0b1020;
  --panel:#0f1724;
  --accent:#6c5ce7;
  --muted:#9aa4b2;
}
body{
  margin:0;
  background:var(--bg);
  color:#fff;
  font-family:Inter,Arial,Helvetica,sans-serif;
  display:flex;
  align-items:center;
  justify-content:center;
  height:100vh;
  overflow:hidden;
}

/* --- Glassy login/register --- */
.hidden{display:none!important}
.login-container{
  width:90%;
  max-width:400px;
  padding:40px 30px;
  background:rgba(15,23,36,0.8);
  backdrop-filter:blur(14px);
  border-radius:16px;
  border:1px solid rgba(255,255,255,0.08);
  box-shadow:0 10px 40px rgba(0,0,0,0.6);
  text-align:center;
  animation:slideIn 0.8s ease;
}
@keyframes slideIn{from{transform:translateY(40px);opacity:0}to{transform:translateY(0);opacity:1}}
.login-container h2{
  color:var(--accent);
  font-weight:700;
  letter-spacing:1px;
  margin-bottom:20px;
  font-size:22px;
}
.login-container input{
  width:100%;
  padding:12px;
  margin:8px 0;
  border-radius:10px;
  border:1px solid rgba(255,255,255,0.1);
  background:rgba(255,255,255,0.05);
  color:#fff;
  font-size:15px;
  transition:all .3s ease;
}
.login-container input:focus{
  outline:none;
  border-color:var(--accent);
  box-shadow:0 0 8px var(--accent);
}
.login-container button{
  width:100%;
  padding:12px;
  margin-top:14px;
  background:linear-gradient(135deg,var(--accent),#00bcd4);
  border:none;
  border-radius:10px;
  color:#fff;
  cursor:pointer;
  font-weight:600;
  font-size:15px;
  letter-spacing:0.5px;
  transition:transform .2s ease, box-shadow .2s ease;
}
.login-container button:hover{
  transform:scale(1.04);
  box-shadow:0 0 15px rgba(108,92,231,0.6);
}
.switch{
  margin-top:16px;
  font-size:14px;
  color:var(--muted);
  cursor:pointer;
  transition:color .3s;
}
.switch:hover{color:var(--accent);}
.logout-btn{
  position:absolute;
  top:60px;
  right:16px;
  background:#666666;
  border:none;
  color:#fff;
  padding:8px 14px;
  border-radius:8px;
  cursor:pointer;
  font-weight:600;
  transition:background .3s;
  z-index:10;
}
.logout-btn:hover{background:#ff6f6f;}

/* --- Chat UI --- */
.chat{width:100%;max-width:760px;height:90vh;background:linear-gradient(180deg, rgba(255,255,255,0.02), transparent);border-radius:14px;box-shadow:0 10px 30px rgba(0,0,0,0.6);display:flex;flex-direction:column;overflow:hidden;border:1px solid rgba(255,255,255,0.03);position:relative;}
.header{padding:18px 20px;display:flex;align-items:center;gap:12px;border-bottom:1px solid rgba(255,255,255,0.03)}
.logo{width:48px;height:48px;border-radius:10px;background:linear-gradient(135deg,var(--accent),#00bcd4);display:flex;align-items:center;justify-content:center;font-weight:700}
.title{font-size:18px}
.body{flex:1;padding:20px;overflow:auto;display:flex;flex-direction:column;gap:12px}
.bubbles{display:flex;flex-direction:column;gap:12px;max-width:100%}
.bubble{padding:12px 16px;border-radius:12px;max-width:75%;line-height:1.3;position:relative}
.user{align-self:flex-end;background: linear-gradient(90deg, #3b3f50, #1f2230);color:white;border-bottom-right-radius:4px;}
.bot{align-self:flex-start;background: rgba(75,63,127,0.15);color: #fff;border-bottom-left-radius:4px;}
.footer{padding:12px 16px;border-top:1px solid rgba(255,255,255,0.03);display:flex;gap:8px;align-items:center}
input{flex:1;padding:12px;border-radius:10px;border:1px solid rgba(255,255,255,0.04);background:transparent;color:#fff}
button.send{background:var(--accent);border:none;color:white;padding:10px 14px;border-radius:10px;cursor:pointer}
button.reset{background:#666666;border:none;color:white;padding:9px 9px;border-radius:10px;cursor:pointer;font-weight:600}
button.reset:hover{background:#999999}
.timestamp{font-size:12px;color:var(--muted);position:absolute;bottom:-16px;right:8px}
.product-img{width:80px;height:80px;border-radius:8px;}

/* ✅ Professional Small WhatsApp Button */
.whatsapp-btn {
  position: fixed;
  right: 10px;
  bottom:110px;
  width: 40px;
  height: 40px;
  border-radius: 50%;
  background: linear-gradient(145deg, #25D366, #128C7E);
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 20px;
  color: white;
  box-shadow: 0 6px 18px rgba(0,0,0,0.3);
  cursor: pointer;
  z-index: 1000;
  transition: transform 0.2s ease, box-shadow 0.2s ease;
  border: none;
}
.whatsapp-btn:hover { transform: scale(1.1); box-shadow: 0 8px 24px rgba(0,0,0,0.4); }
.whatsapp-btn::after {
  content: "Chat on WhatsApp";
  position: absolute;
  right: 50px;
  bottom: 12px;
  background: #25D366;
  color: #fff;
  font-size: 12px;
  font-weight: 500;
  padding: 4px 8px;
  border-radius: 6px;
  white-space: nowrap;
  opacity: 0;
  pointer-events: none;
  transform: translateY(5px);
  transition: opacity 0.3s ease, transform 0.3s ease;
}
.whatsapp-btn::before {
  content: "";
  position: absolute;
  right: 40px;
  bottom: 160px;
  width: 0;
  height: 0;
  border-left: 6px solid #25D366;
  border-top: 6px solid transparent;
  border-bottom: 6px solid transparent;
  opacity: 0;
  transition: opacity 0.3s ease;
}
.whatsapp-btn:hover::after,
.whatsapp-btn:hover::before { opacity:1; transform: translateY(0); }
</style>
</head>
<body>

<!-- LOGIN PAGE -->
<div class="login-container" id="loginPage">
  <h2 id="formTitle">Login</h2>
  <input type="text" id="username" placeholder="Username" autocomplete="off">
  <input type="password" id="password" placeholder="Password">
  <button id="authBtn">Login</button>
  <div class="switch" id="switchMode">Don’t have an account? Register</div>
</div>

<!-- CHAT PAGE -->
<div id="chatPage" class="hidden">
  <button class="logout-btn" id="logoutBtn">Logout</button>

  <div class="chat">
    <div class="header">
      <div class="logo">NP</div>
      <div>
        <div class="title">NYPADROX Support</div>
        <div class="muted">Online Mode</div>
      </div>
    </div>
    <div class="body" id="body">
      <div class="bubbles" id="bubbles">
        <div class="bubble bot">
          (NP: Welcome to NYPADROX — how can we help you today?<br>
          For orders email <span style="color:skyblue;">Rowlandmchinyira5@gmail.com</span> or call 
          <span style="color:skyblue;">+265 899 174 287</span> / 
          <span style="color:skyblue;">+265 990 672 107</span>)
          <div class="timestamp"></div>
        </div>
      </div>
    </div>
    <div class="footer">
      <input id="msg" placeholder="Type your message..." autocomplete="off">
      <button class="send" id="sendBtn">Send</button>
      <button class="reset" id="resetBtn">Reset Chat</button>
    </div>
  </div>
</div>

<!-- WhatsApp Button -->
<a href="https://wa.me/265899174287" target="_blank" class="whatsapp-btn">W</a>

<script>
// --- LOGIN SYSTEM ---
const loginPage=document.getElementById('loginPage');
const chatPage=document.getElementById('chatPage');
const switchMode=document.getElementById('switchMode');
const authBtn=document.getElementById('authBtn');
const formTitle=document.getElementById('formTitle');
const logoutBtn=document.getElementById('logoutBtn');
let isLoginMode=true;

switchMode.onclick=()=>{
  isLoginMode=!isLoginMode;
  formTitle.textContent=isLoginMode?'Login':'Register';
  authBtn.textContent=isLoginMode?'Login':'Register';
  switchMode.textContent=isLoginMode?'Don’t have an account? Register':'Already have an account? Login';
};

authBtn.onclick=()=>{
  const user=document.getElementById('username').value.trim();
  const pass=document.getElementById('password').value.trim();
  if(!user||!pass){alert('Please enter username and password');return;}
  const users=JSON.parse(localStorage.getItem('users')||'{}');
  if(isLoginMode){
    if(users[user]&&users[user]===pass){
      localStorage.setItem('loggedInUser',user);
      fadeOutLogin(user);
    }else alert('Invalid credentials');
  }else{
    if(users[user]){alert('Username already exists');return;}
    users[user]=pass;
    localStorage.setItem('users',JSON.stringify(users));
    alert('Registered successfully! You can now log in.');
    isLoginMode=true;
    formTitle.textContent='Login';
    authBtn.textContent='Login';
    switchMode.textContent='Don’t have an account? Register';
  }
};

logoutBtn.onclick=()=>{
  localStorage.removeItem('loggedInUser');
  chatPage.classList.add('hidden');
  loginPage.classList.remove('hidden');
};

function fadeOutLogin(username){
  loginPage.style.opacity='1';
  const fade=setInterval(()=>{
    loginPage.style.opacity=String(parseFloat(loginPage.style.opacity)-0.05);
    if(parseFloat(loginPage.style.opacity)<=0){
      clearInterval(fade);
      showChat(username);
      loginPage.style.opacity='1';
    }
  },30);
}

function showChat(username){
  loginPage.classList.add('hidden');
  chatPage.classList.remove('hidden');
  if(username){
    setTimeout(()=>typeResponse(`👋 Welcome back, <strong>${username}</strong>!<br>NP: How can Nypadrox assist you today?`),500);
  }
}

// --- BOT SCRIPT (keywords, catalog, typing) ---
const productImages = {
  "solar":"solar.jpg","drone":"drone.png","laptop":"laptop.jpg",
  "maize":"maize.jpg","beans":"beans.png","chicken":"chicken.jpg",
  "arduino":"arduino.jpg","computer":"computer.jpg"
};
const productsCatalog = {
  "Electronics": ['solar', 'arduino', 'drone','computer','laptop'],
  "Crops": ['maize', 'beans'],
  "Animals": ['chicken']
};
const productMap={"maiz":"maize","bean":"beans","chikn":"chicken","comper":"computer","laptap":"laptop","drons":"drone","chik":"chicken"};
const productsKeywords=[];
for(const cat in productsCatalog){
  productsCatalog[cat].forEach(i=>productsKeywords.push(i.toLowerCase()));
}
Object.keys(productMap).forEach(k=>productsKeywords.push(k.toLowerCase()));
const botEmojis=["🙂","🤖","👍","💡"];
const genericResponses=[
  "I'm here to help! Ask about products, orders, or support.",
  "Sure! You can ask about any of our products or services.",
  "That's interesting! Did you want to place an order or see our catalog?",
  "I can help with orders, product info, or guidance. What would you like?"
];
const responses=[
  {text:"Hello there! What would you like to buy or order from Nypadrox today?",keywords:['hi','hello','hey'],required:[]},
  {text:"I'm doing fine, thanks for asking! How about you?",keywords:['how','are','you'],required:['how']},
  {text:"You're welcome!",keywords:['thank','thanks'],required:[]},
  {text:"Goodbye! Talk to you later",keywords:['bye','goodbye','see','you'],required:[]},
  {text:"We sell: solar, arduino, drone, computers, maize, beans, chicken. Call <span style='color:skyblue;'>+265 899 174 287</span> or <span style='color:skyblue;'>+265 990 672 107</span> or email <span style='color:skyblue;'>Rowlandmchinyira5@gmail.com</span>",keywords:['buy','order','want','need','purchase','product','item','sell'],required:[]},
  {text:"I am NP, Nypadrox AI assistant in sales",keywords:["what","name","who"],required:[]}
];
const bubbles=document.getElementById('bubbles');
const bodyEl=document.getElementById('body');
function detectProducts(msg){
  const found=[];
  productsKeywords.forEach(p=>{if(msg.toLowerCase().includes(p))found.push(productMap[p]||p)});
  return [...new Set(found)];
}
function appendEmoji(t){return t+" "+botEmojis[Math.floor(Math.random()*botEmojis.length)]}
function addBubble(t,type){
  const b=document.createElement('div');
  b.className='bubble '+type;
  b.innerHTML=t+'<div class="timestamp">'+new Date().toLocaleTimeString()+'</div>';
  bubbles.appendChild(b);
  bodyEl.scrollTo({top:bodyEl.scrollHeight,behavior:'smooth'});
  return b;
}
function typeResponse(t, products=[]){
  const b=addBubble('', 'bot');
  let i=0;
  const cursor='<span class="cursor">|</span>';
  function next(){
    if(i<=t.length){
      b.innerHTML=t.slice(0,i)+cursor+'<div class="timestamp">'+new Date().toLocaleTimeString()+'</div>';
      bodyEl.scrollTo({top:bodyEl.scrollHeight,behavior:'smooth'});
      i++;
      setTimeout(next,20);
    } else {
      b.innerHTML=t+'<div class="timestamp">'+new Date().toLocaleTimeString()+'</div>';
      if(products.length){
        const imgs=document.createElement('div');
        imgs.style.display='flex';
        imgs.style.flexWrap='wrap';
        imgs.style.gap='8px';
        products.forEach(p=>{
          const img=document.createElement('img');
          img.src=productImages[p];
          img.className='product-img';
          imgs.appendChild(img);
        });
        b.appendChild(imgs);
      }
      bodyEl.scrollTo({top:bodyEl.scrollHeight,behavior:'smooth'});
    }
  }
  next();
}
function sendMessage(){
  const text=document.getElementById('msg').value.trim();
  if(!text) return;
  addBubble('<strong>You:</strong> '+text,'user');
  document.getElementById('msg').value='';
  const foundProducts = detectProducts(text);
  let matched=false;
  for(const r of responses){
    const allReq=r.required.every(w=>text.toLowerCase().includes(w));
    const hasKeyword=r.keywords.some(w=>text.toLowerCase().includes(w));
    if(allReq && (hasKeyword || r.required.length>0)){
      typeResponse(appendEmoji(r.text), foundProducts);
      matched=true;
      break;
    }
  }
  if(!matched){
    if(foundProducts.length) typeResponse("Here are the products you asked for:", foundProducts);
    else typeResponse(appendEmoji(genericResponses[Math.floor(Math.random()*genericResponses.length)]));
  }
}
document.getElementById('sendBtn').onclick=sendMessage;
document.getElementById('msg').addEventListener('keydown', e=>{if(e.key==='Enter') sendMessage();});
document.getElementById('resetBtn').onclick=()=>{bubbles.innerHTML=''; typeResponse("Chat reset. How can I assist you?");};
const savedUser=localStorage.getItem('loggedInUser');
if(savedUser) showChat(savedUser);
</script>
</body>
</html>
