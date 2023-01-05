const allChk = document.member_insert.allcheck;
const mail = document.member_insert.mailYN;
const sms = document.member_insert.smsYN;
const terms = document.member_insert.termsYN;

allChk.addEventListener('click', ()=> {
    if (allChk.checked) {
        mail[0].checked = true;
        sms[0].checked = true;
        terms[0].checked = true;
    }
    else {
        mail[0].checked = false;
        sms[0].checked = false;
        terms[0].checked = false;
    }
})

const email1 = document.member_insert.email1;
const email2 = document.member_insert.email2;
const email3 = document.member_insert.email3;
console.log(email1, email2, email3)

email3.addEventListener('change', ()=> {
    email2.value = email3.value
})
