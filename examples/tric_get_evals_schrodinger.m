%%
clear

%% 
dom = surfacemesh.import('baby_triceratops.csv', 'rhino');
dom=resample(dom,13);
figure
plot(dom)

length(dom)
order(dom)

%%
nums_weyl=pi*surfacearea(dom)*(1000)/(2*pi)^2;
disp(nums_weyl)

%%
V=@(x,y,z) x.^2+y.^2+z.^2;

%% 
[D1,~,res1]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',10,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D1,idx]=sort(real(D1));
res1=res1(idx);
disp(D1)
disp(res1)
save('evals1s','D1','res1')

[D2,~,res2]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',30,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D2,idx]=sort(real(D2));
res2=res2(idx);
disp(D2)
disp(res2)
save('evals2s','D2','res2')

[D3,~,res3]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',50,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D3,idx]=sort(real(D3));
res3=res3(idx);
disp(D3)
disp(res3)
save('evals3s','D3','res3')

[D4,~,res4]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',70,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D4,idx]=sort(real(D4));
res4=res4(idx);
disp(D4)
disp(res4)
save('evals4s','D4','res4')

[D5,~,res5]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',90,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D5,idx]=sort(real(D5));
res5=res5(idx);
disp(D5)
disp(res5)
save('evals5s','D5','res5')

[D6,~,res6]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',110,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D6,idx]=sort(real(D6));
res6=res6(idx);
disp(D6)
disp(res6)
save('evals6s','D6','res6')

[D7,~,res7]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',130,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D7,idx]=sort(real(D7));
res7=res7(idx);
disp(D7)
disp(res7)
save('evals7s','D7','res7')

[D8,~,res8]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',150,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D8,idx]=sort(real(D8));
res8=res8(idx);
disp(D8)
disp(res8)
save('evals8s','D8','res8')

[D9,~,res9]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',170,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D9,idx]=sort(real(D9));
res9=res9(idx);
disp(D9)
disp(res9)
save('evals9s','D9','res9')

[D10,~,res10]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',190,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D10,idx]=sort(real(D10));
res10=res10(idx);
disp(D10)
disp(res10)
save('evals10s','D10','res10')

[D11,~,res11]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',210,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D11,idx]=sort(real(D11));
res11=res11(idx);
disp(D11)
disp(res11)
save('evals11s','D11','res11')

[D12,~,res12]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',230,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D12,idx]=sort(real(D12));
res12=res12(idx);
disp(D12)
disp(res12)
save('evals12s','D12','res12')

[D13,~,res13]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',250,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D13,idx]=sort(real(D13));
res13=res13(idx);
disp(D13)
disp(res13)
save('evals13s','D13','res13')

[D14,~,res14]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',270,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D14,idx]=sort(real(D14));
res14=res14(idx);
disp(D14)
disp(res14)
save('evals14s','D14','res14')

[D15,~,res15]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',290,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D15,idx]=sort(real(D15));
res15=res15(idx);
disp(D15)
disp(res15)
save('evals15s','D15','res15')

[D16,~,res16]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',310,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D16,idx]=sort(real(D16));
res16=res16(idx);
disp(D16)
disp(res16)
save('evals16s','D16','res16')

[D17,~,res17]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',330,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D17,idx]=sort(real(D17));
res17=res17(idx);
disp(D17)
disp(res17)
save('evals17s','D17','res17')

[D18,~,res18]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',350,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D18,idx]=sort(real(D18));
res18=res18(idx);
disp(D18)
disp(res18)
save('evals18s','D18','res18')

[D19,~,res19]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',370,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D19,idx]=sort(real(D19));
res19=res19(idx);
disp(D19)
disp(res19)
save('evals19s','D19','res19')

[D20,~,res20]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',390,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D20,idx]=sort(real(D20));
res20=res20(idx);
disp(D20)
disp(res20)
save('evals20s','D20','res20')

[D21,~,res21]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',410,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D21,idx]=sort(real(D21));
res21=res21(idx);
disp(D21)
disp(res21)
save('evals21s','D21','res21')

[D22,~,res22]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',430,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D22,idx]=sort(real(D22));
res22=res22(idx);
disp(D22)
disp(res22)
save('evals22s','D22','res22')

[D23,~,res23]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',450,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D23,idx]=sort(real(D23));
res23=res23(idx);
disp(D23)
disp(res23)
save('evals23s','D23','res23')

[D24,~,res24]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',470,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D24,idx]=sort(real(D24));
res24=res24(idx);
disp(D24)
disp(res24)
save('evals24s','D24','res24')

[D25,~,res25]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',490,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D25,idx]=sort(real(D25));
res25=res25(idx);
disp(D25)
disp(res25)
save('evals25s','D25','res25')

[D26,~,res26]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',510,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D26,idx]=sort(real(D26));
res26=res26(idx);
disp(D26)
disp(res26)
save('evals26s','D26','res26')

[D27,~,res27]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',530,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D27,idx]=sort(real(D27));
res27=res27(idx);
disp(D27)
disp(res27)
save('evals27s','D27','res27')

[D28,~,res28]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',550,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D28,idx]=sort(real(D28));
res28=res28(idx);
disp(D28)
disp(res28)
save('evals28s','D28','res28')

[D29,~,res29]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',570,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D29,idx]=sort(real(D29));
res29=res29(idx);
disp(D29)
disp(res29)
save('evals29s','D29','res29')

[D30,~,res30]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',590,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D30,idx]=sort(real(D30));
res30=res30(idx);
disp(D30)
disp(res30)
save('evals30s','D30','res30')

[D31,~,res31]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',610,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D31,idx]=sort(real(D31));
res31=res31(idx);
disp(D31)
disp(res31)
save('evals31s','D31','res31')

[D32,~,res32]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',630,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D32,idx]=sort(real(D32));
res32=res32(idx);
disp(D32)
disp(res32)
save('evals32s','D32','res32')

[D33,~,res33]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',650,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D33,idx]=sort(real(D33));
res33=res33(idx);
disp(D33)
disp(res33)
save('evals33s','D33','res33')

[D34,~,res34]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',670,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D34,idx]=sort(real(D34));
res34=res34(idx);
disp(D34)
disp(res34)
save('evals34s','D34','res34')

[D35,~,res35]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',690,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D35,idx]=sort(real(D35));
res35=res35(idx);
disp(D35)
disp(res35)
save('evals35s','D35','res35')

[D36,~,res36]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',710,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D36,idx]=sort(real(D36));
res36=res36(idx);
disp(D36)
disp(res36)
save('evals36s','D36','res36')

[D37,~,res37]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',730,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D37,idx]=sort(real(D37));
res37=res37(idx);
disp(D37)
disp(res37)
save('evals37s','D37','res37')

[D38,~,res38]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',750,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D38,idx]=sort(real(D38));
res38=res38(idx);
disp(D38)
disp(res38)
save('evals38s','D38','res38')

[D39,~,res39]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',770,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D39,idx]=sort(real(D39));
res39=res39(idx);
disp(D39)
disp(res39)
save('evals39s','D39','res39')

[D40,~,res40]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',790,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D40,idx]=sort(real(D40));
res40=res40(idx);
disp(D40)
disp(res40)
save('evals40s','D40','res40')

[D41,~,res41]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',810,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D41,idx]=sort(real(D41));
res41=res41(idx);
disp(D41)
disp(res41)
save('evals41s','D41','res41')

[D42,~,res42]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',830,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D42,idx]=sort(real(D42));
res42=res42(idx);
disp(D42)
disp(res42)
save('evals42s','D42','res42')

[D43,~,res43]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',850,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D43,idx]=sort(real(D43));
res43=res43(idx);
disp(D43)
disp(res43)
save('evals43s','D43','res43')

[D44,~,res44]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',870,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D44,idx]=sort(real(D44));
res44=res44(idx);
disp(D44)
disp(res44)
save('evals44s','D44','res44')

[D45,~,res45]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',890,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D45,idx]=sort(real(D45));
res45=res45(idx);
disp(D45)
disp(res45)
save('evals45s','D45','res45')

[D46,~,res46]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',910,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D46,idx]=sort(real(D46));
res46=res46(idx);
disp(D46)
disp(res46)
save('evals46s','D46','res46')

[D47,~,res47]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',930,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D47,idx]=sort(real(D47));
res47=res47(idx);
disp(D47)
disp(res47)
save('evals47s','D47','res47')

[D48,~,res48]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',950,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D48,idx]=sort(real(D48));
res48=res48(idx);
disp(D48)
disp(res48)
save('evals48s','D48','res48')

[D49,~,res49]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',970,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D49,idx]=sort(real(D49));
res49=res49(idx);
disp(D49)
disp(res49)
save('evals49s','D49','res49')

[D50,~,res50]=schrSpec2(dom,'closed',0,V,'contour','circle','radii',10.1,'centre',990,'m',30,'max_its',2,'num_nodes',15,'svdTOL',10^(-8));
[D50,idx]=sort(real(D50));
res50=res50(idx);
disp(D50)
disp(res50)
save('evals50s','D50','res50')

%%
tric_lap_evals_s=[D1; D2; D3; D4; D5; D6; D7; D8; D9; D10; D11; D12; D13; D14; D15; D16; D17; D18; D19; D20; D21; D22; D23; D24; D25; D26; D27; D28; D29; D30; D31; D32; D33; D34; D35; D36; D37; D38; D39; D40; D41; D42; D43; D44; D45; D46; D47; D48; D49; D50];
tric_lap_res_s=[res1; res2;res3;res4;res5;res6;res7;res8;res9;res10;res11;res12;res13;res14;res15;res16;res17;res18;res19;res20;res21;res22;res23;res24;res25;res26;res27;res28;res29;res30;res31;res32;res33;res34;res35;res36;res37;res38;res39;res40;res41;res42;res43;res44;res45;res46;res47;res48;res49;res50];

%% spurious evals record to remove
%res2, 23.6
%res3, 57.95
%res6, 109.3
%res7, 136.8
%res26, 516.0
%res29, 559.5
%res35, 684.4
%res36, 708.9
%res38, 755.9
%res49, 979.7

%%
save('tric_schr_evals')