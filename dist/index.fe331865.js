const a=[{nama:"Dra. Dinna Amriyati",jabatan:"Kepala Sekolah",photo:"https://lh3.googleusercontent.com/d/1gyaZm7MvL48inUIkWEFSCdX11BfGTrDr=w1000",nip:"196704051988102001",email:"dinna.amriyati@kuduskab.go.id",phone:"0815 7586 6917"},{nama:"Triantingtyas Marta Dewi, S.Pd",jabatan:"Guru Kelas 3",photo:"https://lh3.googleusercontent.com/d/1E-80JL5wP8zNJsWrGy9FeerTs-VoCR_I=w1000",nip:"198909302019032008",email:"marta.dewi@kuduskab.go.id",phone:"0857 4078 6860"},{nama:"Sutikno, S.Pd",jabatan:"Guru Kelas 6",photo:"https://lh3.googleusercontent.com/d/11nPGqjnUsHFcjA09enDGfrPOL-5VmEmL=w1000",nip:"197907202014061007",email:"sutikno@kuduskab.go.id",phone:"0816 668 836"}];window.onload=e=>{$("a[router]").click(e=>{e.preventDefault();let n=e.target.pathname.substring(1)-1;history.pushState(a[n],n,e.target.pathname),t(a[n])}),t(a[0])},window.onpopstate=a=>t(a.state);const t=a=>{var t;let e;$(".img-avatar>img").addClass("hide"),$("h3").text(a.nama),$(".title").text(a.jabatan),$(".nip>a:nth-child(2)").text(a.nip),$(".icons>div:nth-child(2) a").text(a.email),$(".icons>div:nth-child(1) a").text(a.phone),t=a.photo,(e=new Image).complete?($(".img-avatar>img").attr("src",t),$(".img-avatar>img").removeClass("hide")):e.onload=function(){$(".img-avatar>img").attr("src",t),$(".img-avatar>img").removeClass("hide")},e.src=t};
//# sourceMappingURL=index.fe331865.js.map
