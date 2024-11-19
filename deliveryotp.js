    function sendOTP() {
        const email = document.getElementById('email');
        const id = document.getElementById('o_id');
        const otpverify = document.getElementsByClassName('otpverify')[0];

        let otp_val = Math.floor(Math.random() * 10000);

        let emailbody = `<div style="height : 300px;width: 500px; margin: 20px; border: 2px solid black; background-color: black;">
        <div style="display: flex;">
        <img src="https://i.postimg.cc/bwsBDW5k/logo2.png" alt="" height="100px" width="120px" style="margin: 10px;">
        <h1 style="margin-left: 20px; color: azure; font-size:35px; padding-top: 20px;">System Station</h1><br/>
    </div>
        <hr>
        <h2 style="color: azure; margin: 25px;">Delivery verification <br>kindly do not share with anyone</h2>
        <div style="font-size: 50px; color: brown; margin: 25px;">${otp_val}</div>
    </div>`;
        Email.send({
        SecureToken : "6ac31da1-1dc5-4804-8fb6-962206c361b1",
        To : email.value,
        From : "systemstation06@gmail.com",
        Subject : "Email OTP using JavaScript",
        Body : emailbody,
    }).then(

        message => {	
            if (message === "OK") {
                alert("OTP is sent to email " + email.value);

                otpverify.style.display = "flex";
                const otp_inp = document.getElementById('otp_inp');
                const otp_btn = document.getElementById('otp-btn');

                otp_btn.addEventListener('click', () => {
                    if (otp_inp.value == otp_val) {
                        window.location.href="deliverySucc.jsp?e="+email.value+"&order="+id.value;
                    }
                    else {
                        alert("Invalid OTP");
                    }
                    
                })
            }
        }
    );
    }