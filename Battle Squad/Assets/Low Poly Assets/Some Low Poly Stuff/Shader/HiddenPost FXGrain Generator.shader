Shader "Hidden/Post FX/Grain Generator" {
	Properties {
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 35105
			Program "vp" {
				SubProgram "d3d11 " {
					"!!DX11VertexSM40
					//
					// Generated by Microsoft (R) D3D Shader Disassembler
					//
					//
					// Input signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// POSITION                 0   xyzw        0     NONE   float   xyz 
					// TEXCOORD                 0   xyzw        1     NONE   float   xy  
					//
					//
					// Output signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// SV_POSITION              0   xyzw        0      POS   float   xyzw
					// TEXCOORD                 0   xy          1     NONE   float   xy  
					// TEXCOORD                 1     zw        1     NONE   float     zw
					//
					vs_4_0
					dcl_constantbuffer CB0[4], immediateIndexed
					dcl_constantbuffer CB1[4], immediateIndexed
					dcl_constantbuffer CB2[21], immediateIndexed
					dcl_input v0.xyz
					dcl_input v1.xy
					dcl_output_siv o0.xyzw, position
					dcl_output o1.xy
					dcl_output o1.zw
					dcl_temps 2
					mul r0.xyzw, v0.yyyy, cb1[1].xyzw
					mad r0.xyzw, cb1[0].xyzw, v0.xxxx, r0.xyzw
					mad r0.xyzw, cb1[2].xyzw, v0.zzzz, r0.xyzw
					add r0.xyzw, r0.xyzw, cb1[3].xyzw
					mul r1.xyzw, r0.yyyy, cb2[18].xyzw
					mad r1.xyzw, cb2[17].xyzw, r0.xxxx, r1.xyzw
					mad r1.xyzw, cb2[19].xyzw, r0.zzzz, r1.xyzw
					mad o0.xyzw, cb2[20].xyzw, r0.wwww, r1.xyzw
					mad o1.zw, v1.xxxy, cb0[3].xxxy, cb0[3].zzzw
					mov o1.xy, v1.xyxx
					ret 
					// Approximately 0 instruction slots used"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					"!!DX11PixelSM40
					//
					// Generated by Microsoft (R) D3D Shader Disassembler
					//
					//
					// Input signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// SV_POSITION              0   xyzw        0      POS   float       
					// TEXCOORD                 0   xy          1     NONE   float   xy  
					// TEXCOORD                 1     zw        1     NONE   float       
					//
					//
					// Output signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// SV_Target                0   xyzw        0   TARGET   float   xyzw
					//
					ps_4_0
					dcl_constantbuffer CB0[5], immediateIndexed
					dcl_input_ps linear v1.xy
					dcl_output o0.xyzw
					dcl_temps 7
					frc r0.y, cb0[4].x
					mad r1.xyzw, v1.xyxy, l(192.000000, 192.000000, 192.000000, 192.000000), r0.yyyy
					add r2.xyzw, r1.zwzw, l(-2.000000, -2.000000, -1.000000, -2.000000)
					dp2 r2.x, r2.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r2.y, r2.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r2.xy, null, r2.xyxx
					mul r2.xy, r2.xyxx, l(43758.546875, 43758.546875, 0.000000, 0.000000)
					frc r2.xy, r2.xyxx
					mad r2.x, r2.y, l(2.000000), r2.x
					mov r0.xzw, l(0,0,-2.000000,-1.000000)
					mad r3.xyzw, v1.xyxy, l(192.000000, 192.000000, 192.000000, 192.000000), r0.xyyx
					add r4.xyzw, r0.yzyw, r3.xyxy
					add r5.xyzw, r0.zywy, r3.zwzw
					dp2 r0.w, r4.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r2.z, r4.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r2.z, null, r2.z
					mul r2.z, r2.z, l(43758.546875)
					sincos r0.w, null, r0.w
					mul r0.w, r0.w, l(43758.546875)
					frc r0.w, r0.w
					add r2.x, r0.w, r2.x
					add r4.xyzw, r1.zwzw, l(-2.000000, -1.000000, -1.000000, -1.000000)
					dp2 r2.w, r4.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r4.x, r4.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r4.x, null, r4.x
					mul r4.x, r4.x, l(43758.546875)
					frc r4.x, r4.x
					sincos r2.w, null, r2.w
					mul r2.w, r2.w, l(43758.546875)
					frc r2.zw, r2.zzzw
					mad r2.x, r2.w, l(2.000000), r2.x
					mad r2.w, r4.x, l(2.000000), r2.w
					mad r2.x, r4.x, l(-12.000000), r2.x
					mad r2.x, r2.z, l(2.000000), r2.x
					dp2 r4.y, r5.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r4.z, r5.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r4.yz, null, r4.yyzy
					mul r4.yz, r4.yyzy, l(0.000000, 43758.546875, 43758.546875, 0.000000)
					frc r4.yz, r4.yyzy
					add r2.x, r2.x, r4.y
					mad r2.x, r4.z, l(2.000000), r2.x
					dp2 r4.w, r1.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r4.w, null, r4.w
					mul r4.w, r4.w, l(43758.546875)
					frc r4.w, r4.w
					mad r2.y, r0.w, l(2.000000), r2.y
					add r5.xyzw, r1.zwzw, l(1.000000, -2.000000, 1.000000, -1.000000)
					dp2 r5.x, r5.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r5.y, r5.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r5.xy, null, r5.xyxx
					mul r5.xy, r5.xyxx, l(43758.546875, 43758.546875, 0.000000, 0.000000)
					frc r5.xy, r5.xyxx
					add r2.y, r2.y, r5.x
					mad r0.w, r5.x, l(2.000000), r0.w
					mad r2.y, r4.x, l(2.000000), r2.y
					mad r4.x, r2.z, l(2.000000), r4.x
					add r4.x, r5.y, r4.x
					mad r4.x, r4.z, l(2.000000), r4.x
					mad r4.x, r4.w, l(-12.000000), r4.x
					mad r2.y, r2.z, l(-12.000000), r2.y
					mad r2.y, r5.y, l(2.000000), r2.y
					add r2.xy, r4.wzww, r2.xyxx
					mad r2.y, r4.w, l(2.000000), r2.y
					mov r0.xz, l(1.000000,0,2.000000,0)
					add r6.xyzw, r0.xyzy, r3.zwzw
					add r3.xyzw, r0.yxyz, r3.xyxy
					dp2 r0.x, r6.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r0.y, r6.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r0.xy, null, r0.xyxx
					mul r0.xy, r0.xyxx, l(43758.546875, 43758.546875, 0.000000, 0.000000)
					frc r0.xy, r0.xyxx
					add r0.z, r0.x, r2.y
					mul r0.z, r0.z, l(0.083333)
					mad r0.z, r2.x, l(0.041667), r0.z
					add r6.xyzw, r1.zwzw, l(2.000000, -2.000000, 2.000000, -1.000000)
					dp2 r2.x, r6.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r2.y, r6.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r2.xy, null, r2.xyxx
					mul r2.xy, r2.xyxx, l(43758.546875, 43758.546875, 0.000000, 0.000000)
					frc r2.xy, r2.xyxx
					add r0.w, r0.w, r2.x
					mad r0.w, r2.z, l(2.000000), r0.w
					mad r2.x, r5.y, l(2.000000), r2.z
					mad r0.w, r5.y, l(-12.000000), r0.w
					mad r0.w, r2.y, l(2.000000), r0.w
					add r2.xw, r2.yyyz, r2.xxxw
					mad r2.x, r4.w, l(2.000000), r2.x
					mad r2.x, r0.x, l(-12.000000), r2.x
					mad r2.x, r0.y, l(2.000000), r2.x
					add r0.w, r4.w, r0.w
					mad r0.w, r0.x, l(2.000000), r0.w
					add r0.w, r0.y, r0.w
					mad r0.z, r0.w, l(0.041667), r0.z
					mad r0.w, r4.y, l(2.000000), r2.w
					mad r2.y, r4.z, l(2.000000), r4.y
					add r2.y, r4.w, r2.y
					mad r0.w, r4.z, l(-12.000000), r0.w
					mad r2.z, r4.w, l(2.000000), r4.z
					add r2.z, r0.x, r2.z
					mad r0.w, r4.w, l(2.000000), r0.w
					mad r2.w, r0.x, l(2.000000), r4.w
					mad r0.x, r0.x, l(2.000000), r4.x
					add r0.y, r0.y, r2.w
					add r4.xyzw, r1.zwzw, l(-2.000000, 1.000000, -1.000000, 1.000000)
					dp2 r2.w, r4.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r4.x, r4.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r4.x, null, r4.x
					mul r4.x, r4.x, l(43758.546875)
					frc r4.x, r4.x
					sincos r2.w, null, r2.w
					mul r2.w, r2.w, l(43758.546875)
					frc r2.w, r2.w
					add r0.w, r0.w, r2.w
					mad r2.y, r2.w, l(2.000000), r2.y
					mad r2.y, r4.x, l(-12.000000), r2.y
					mad r0.w, r4.x, l(2.000000), r0.w
					dp2 r2.w, r3.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r3.x, r3.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r3.x, null, r3.x
					mul r3.x, r3.x, l(43758.546875)
					sincos r2.w, null, r2.w
					mul r2.w, r2.w, l(43758.546875)
					frc r2.w, r2.w
					add r0.w, r0.w, r2.w
					mad r0.z, r0.w, l(0.083333), r0.z
					add r0.x, r0.x, r4.x
					mad r0.w, r4.x, l(2.000000), r2.z
					mad r0.w, r2.w, l(-12.000000), r0.w
					mad r0.x, r2.w, l(2.000000), r0.x
					add r4.xyzw, r1.zwzw, l(1.000000, 1.000000, 2.000000, 1.000000)
					dp2 r2.z, r4.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r3.y, r4.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r3.y, null, r3.y
					mul r3.y, r3.y, l(43758.546875)
					frc r3.xy, r3.xyxx
					sincos r2.z, null, r2.z
					mul r2.z, r2.z, l(43758.546875)
					frc r2.z, r2.z
					add r0.x, r0.x, r2.z
					mad r0.x, r0.x, l(0.166667), r0.z
					add r0.z, r2.w, r2.x
					mad r0.z, r2.z, l(2.000000), r0.z
					add r0.z, r3.y, r0.z
					mad r0.x, r0.z, l(0.083333), r0.x
					mad r0.z, r2.w, l(2.000000), r2.y
					mad r0.y, r2.w, l(2.000000), r0.y
					mad r0.y, r2.z, l(-12.000000), r0.y
					mad r0.w, r2.z, l(2.000000), r0.w
					mad r0.y, r3.y, l(2.000000), r0.y
					add r2.xyzw, r1.zwzw, l(-2.000000, 2.000000, -1.000000, 2.000000)
					add r1.xyzw, r1.xyzw, l(1.000000, 2.000000, 2.000000, 2.000000)
					dp2 r2.x, r2.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r2.y, r2.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r2.xy, null, r2.xyxx
					mul r2.xy, r2.xyxx, l(43758.546875, 43758.546875, 0.000000, 0.000000)
					frc r2.xy, r2.xyxx
					add r0.zw, r0.zzzw, r2.xxxy
					mad r0.z, r2.y, l(2.000000), r0.z
					mad r0.w, r3.x, l(2.000000), r0.w
					add r0.yz, r3.xxxx, r0.yyzy
					mad r0.x, r0.z, l(0.041667), r0.x
					dp2 r0.z, r1.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r1.x, r1.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r1.x, null, r1.x
					mul r1.x, r1.x, l(43758.546875)
					frc r1.x, r1.x
					sincos r0.z, null, r0.z
					mul r0.z, r0.z, l(43758.546875)
					frc r0.z, r0.z
					add r0.w, r0.z, r0.w
					mad r0.y, r0.z, l(2.000000), r0.y
					add r0.y, r1.x, r0.y
					mad r0.x, r0.w, l(0.083333), r0.x
					mad r0.x, r0.y, l(0.041667), r0.x
					mul o0.xyz, r0.xxxx, l(0.062500, 0.062500, 0.062500, 0.000000)
					mov o0.w, l(1.000000)
					ret 
					// Approximately 0 instruction slots used"
				}
			}
		}
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			GpuProgramID 72783
			Program "vp" {
				SubProgram "d3d11 " {
					"!!DX11VertexSM40
					//
					// Generated by Microsoft (R) D3D Shader Disassembler
					//
					//
					// Input signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// POSITION                 0   xyzw        0     NONE   float   xyz 
					// TEXCOORD                 0   xyzw        1     NONE   float   xy  
					//
					//
					// Output signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// SV_POSITION              0   xyzw        0      POS   float   xyzw
					// TEXCOORD                 0   xy          1     NONE   float   xy  
					// TEXCOORD                 1     zw        1     NONE   float     zw
					//
					vs_4_0
					dcl_constantbuffer CB0[4], immediateIndexed
					dcl_constantbuffer CB1[4], immediateIndexed
					dcl_constantbuffer CB2[21], immediateIndexed
					dcl_input v0.xyz
					dcl_input v1.xy
					dcl_output_siv o0.xyzw, position
					dcl_output o1.xy
					dcl_output o1.zw
					dcl_temps 2
					mul r0.xyzw, v0.yyyy, cb1[1].xyzw
					mad r0.xyzw, cb1[0].xyzw, v0.xxxx, r0.xyzw
					mad r0.xyzw, cb1[2].xyzw, v0.zzzz, r0.xyzw
					add r0.xyzw, r0.xyzw, cb1[3].xyzw
					mul r1.xyzw, r0.yyyy, cb2[18].xyzw
					mad r1.xyzw, cb2[17].xyzw, r0.xxxx, r1.xyzw
					mad r1.xyzw, cb2[19].xyzw, r0.zzzz, r1.xyzw
					mad o0.xyzw, cb2[20].xyzw, r0.wwww, r1.xyzw
					mad o1.zw, v1.xxxy, cb0[3].xxxy, cb0[3].zzzw
					mov o1.xy, v1.xyxx
					ret 
					// Approximately 0 instruction slots used"
				}
			}
			Program "fp" {
				SubProgram "d3d11 " {
					"!!DX11PixelSM40
					//
					// Generated by Microsoft (R) D3D Shader Disassembler
					//
					//
					// Input signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// SV_POSITION              0   xyzw        0      POS   float       
					// TEXCOORD                 0   xy          1     NONE   float   xy  
					// TEXCOORD                 1     zw        1     NONE   float       
					//
					//
					// Output signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// SV_Target                0   xyzw        0   TARGET   float   xyzw
					//
					ps_4_0
					dcl_constantbuffer CB0[5], immediateIndexed
					dcl_input_ps linear v1.xy
					dcl_output o0.xyzw
					dcl_temps 17
					mad r0.xyzw, v1.xyxy, l(192.000000, 192.000000, 192.000000, 192.000000), l(-2.000000, -2.000000, -1.000000, -1.000000)
					frc r1.x, cb0[4].x
					mad r2.xyzw, r1.xxxx, l(0.130000, 0.130000, 0.130000, 0.130000), r0.xyzw
					dp2 r1.y, r2.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r1.z, r2.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r1.yz, null, r1.yyzy
					mul r1.yz, r1.yyzy, l(0.000000, 43758.546875, 43758.546875, 0.000000)
					mad r2.xyzw, v1.xyxy, l(192.000000, 192.000000, 192.000000, 192.000000), l(-1.000000, -2.000000, 0.000000, -2.000000)
					mad r3.xyzw, r1.xxxx, l(0.130000, 0.130000, 0.130000, 0.130000), r2.xyzw
					dp2 r1.w, r3.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r3.x, r3.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r3.x, null, r3.x
					mul r3.x, r3.x, l(43758.546875)
					frc r3.x, r3.x
					sincos r1.w, null, r1.w
					mul r1.w, r1.w, l(43758.546875)
					frc r1.yzw, r1.yyzw
					mad r1.y, r1.w, l(2.000000), r1.y
					mad r1.w, r3.x, l(2.000000), r1.w
					add r1.y, r3.x, r1.y
					mad r4.xyzw, v1.xyxy, l(192.000000, 192.000000, 192.000000, 192.000000), l(-2.000000, -1.000000, 0.000000, -1.000000)
					mad r5.xyzw, r1.xxxx, l(0.130000, 0.130000, 0.130000, 0.130000), r4.xyzw
					dp2 r3.y, r5.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r3.z, r5.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r3.yz, null, r3.yyzy
					mul r3.yz, r3.yyzy, l(0.000000, 43758.546875, 43758.546875, 0.000000)
					frc r3.yz, r3.yyzy
					mad r1.y, r3.y, l(2.000000), r1.y
					mad r3.y, r1.z, l(2.000000), r3.y
					add r3.y, r3.z, r3.y
					mad r1.y, r1.z, l(-12.000000), r1.y
					mad r1.y, r3.z, l(2.000000), r1.y
					mad r5.xyzw, v1.xyxy, l(192.000000, 192.000000, 192.000000, 192.000000), l(-2.000000, 0.000000, -1.000000, 0.000000)
					mad r6.xyzw, r1.xxxx, l(0.130000, 0.130000, 0.130000, 0.130000), r5.xyzw
					dp2 r3.w, r6.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r6.x, r6.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r6.x, null, r6.x
					mul r6.x, r6.x, l(43758.546875)
					frc r6.x, r6.x
					sincos r3.w, null, r3.w
					mul r3.w, r3.w, l(43758.546875)
					frc r3.w, r3.w
					add r1.y, r1.y, r3.w
					mad r1.y, r6.x, l(2.000000), r1.y
					mul r6.yzw, r1.xxxx, l(0.000000, 0.070000, 0.110000, 0.130000)
					mad r7.xy, v1.xyxx, l(192.000000, 192.000000, 0.000000, 0.000000), r6.wwww
					mad r8.xyzw, v1.xyxy, l(192.000000, 192.000000, 192.000000, 192.000000), r6.yyzz
					dp2 r6.y, r7.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r6.y, null, r6.y
					mul r6.y, r6.y, l(43758.546875)
					frc r6.y, r6.y
					mad r7.xyzw, v1.xyxy, l(192.000000, 192.000000, 192.000000, 192.000000), l(1.000000, -2.000000, 1.000000, -1.000000)
					mad r9.xyzw, r1.xxxx, l(0.130000, 0.130000, 0.130000, 0.130000), r7.xyzw
					dp2 r6.z, r9.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r6.w, r9.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r6.zw, null, r6.zzzw
					mul r6.zw, r6.zzzw, l(0.000000, 0.000000, 43758.546875, 43758.546875)
					frc r6.zw, r6.zzzw
					add r1.yw, r1.yyyw, r6.yyyz
					mad r3.x, r6.z, l(2.000000), r3.x
					mad r1.w, r1.z, l(2.000000), r1.w
					mad r1.z, r3.z, l(2.000000), r1.z
					add r1.z, r6.w, r1.z
					mad r1.z, r6.x, l(2.000000), r1.z
					mad r1.z, r6.y, l(-12.000000), r1.z
					mad r1.w, r3.z, l(-12.000000), r1.w
					mad r1.w, r6.w, l(2.000000), r1.w
					add r1.w, r6.x, r1.w
					mad r1.w, r6.y, l(2.000000), r1.w
					mad r9.xyzw, v1.xyxy, l(192.000000, 192.000000, 192.000000, 192.000000), l(1.000000, 0.000000, 2.000000, -2.000000)
					mad r10.xyzw, r1.xxxx, l(0.130000, 0.130000, 0.130000, 0.130000), r9.xyzw
					dp2 r6.z, r10.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r10.x, r10.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r10.x, null, r10.x
					mul r10.x, r10.x, l(43758.546875)
					frc r10.x, r10.x
					add r3.x, r3.x, r10.x
					mad r3.x, r3.z, l(2.000000), r3.x
					mad r3.z, r6.w, l(2.000000), r3.z
					mad r3.x, r6.w, l(-12.000000), r3.x
					sincos r6.z, null, r6.z
					mul r6.z, r6.z, l(43758.546875)
					frc r6.z, r6.z
					add r1.w, r1.w, r6.z
					mul r1.w, r1.w, l(0.083333)
					mad r1.y, r1.y, l(0.041667), r1.w
					mad r10.xyzw, v1.xyxy, l(192.000000, 192.000000, 192.000000, 192.000000), l(2.000000, -1.000000, 2.000000, 0.000000)
					mad r11.xyzw, r1.xxxx, l(0.130000, 0.130000, 0.130000, 0.130000), r10.xyzw
					dp2 r1.w, r11.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r6.w, r11.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r6.w, null, r6.w
					mul r6.w, r6.w, l(43758.546875)
					frc r6.w, r6.w
					sincos r1.w, null, r1.w
					mul r1.w, r1.w, l(43758.546875)
					frc r1.w, r1.w
					mad r3.x, r1.w, l(2.000000), r3.x
					add r1.w, r1.w, r3.z
					mad r1.w, r6.y, l(2.000000), r1.w
					mad r1.w, r6.z, l(-12.000000), r1.w
					mad r1.w, r6.w, l(2.000000), r1.w
					add r3.x, r6.y, r3.x
					mad r3.x, r6.z, l(2.000000), r3.x
					add r3.x, r6.w, r3.x
					mad r1.y, r3.x, l(0.041667), r1.y
					mad r3.x, r3.w, l(2.000000), r3.y
					mad r3.y, r6.x, l(2.000000), r3.w
					mad r3.x, r6.x, l(-12.000000), r3.x
					mad r3.z, r6.y, l(2.000000), r6.x
					mad r3.x, r6.y, l(2.000000), r3.x
					mad r3.w, r6.z, l(2.000000), r6.y
					mad r1.z, r6.z, l(2.000000), r1.z
					add r3.yzw, r6.yyzw, r3.yyzw
					mad r6.xyzw, v1.xyxy, l(192.000000, 192.000000, 192.000000, 192.000000), l(-2.000000, 1.000000, -1.000000, 1.000000)
					mad r11.xyzw, r1.xxxx, l(0.130000, 0.130000, 0.130000, 0.130000), r6.xyzw
					dp2 r11.x, r11.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r11.y, r11.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r11.xy, null, r11.xyxx
					mul r11.xy, r11.xyxx, l(43758.546875, 43758.546875, 0.000000, 0.000000)
					frc r11.xy, r11.xyxx
					add r3.x, r3.x, r11.x
					mad r3.y, r11.x, l(2.000000), r3.y
					mad r3.y, r11.y, l(-12.000000), r3.y
					mad r3.x, r11.y, l(2.000000), r3.x
					mad r12.xyzw, v1.xyxy, l(192.000000, 192.000000, 192.000000, 192.000000), l(0.000000, 1.000000, 1.000000, 1.000000)
					mad r13.xyzw, r1.xxxx, l(0.130000, 0.130000, 0.130000, 0.130000), r12.xyzw
					dp2 r11.x, r13.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r11.z, r13.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r11.xz, null, r11.xxzx
					mul r11.xz, r11.xxzx, l(43758.546875, 0.000000, 43758.546875, 0.000000)
					frc r11.xz, r11.xxzx
					add r3.x, r3.x, r11.x
					mad r1.y, r3.x, l(0.083333), r1.y
					add r1.z, r1.z, r11.y
					mad r3.x, r11.y, l(2.000000), r3.z
					mad r3.x, r11.x, l(-12.000000), r3.x
					mad r3.x, r11.z, l(2.000000), r3.x
					mad r1.z, r11.x, l(2.000000), r1.z
					add r1.z, r11.z, r1.z
					mad r1.y, r1.z, l(0.166667), r1.y
					add r1.z, r1.w, r11.x
					mad r1.z, r11.z, l(2.000000), r1.z
					mad r13.xyzw, v1.xyxy, l(192.000000, 192.000000, 192.000000, 192.000000), l(2.000000, 1.000000, -2.000000, 2.000000)
					mad r14.xyzw, r1.xxxx, l(0.130000, 0.130000, 0.130000, 0.130000), r13.xyzw
					dp2 r1.w, r14.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r3.z, r14.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r3.z, null, r3.z
					mul r3.z, r3.z, l(43758.546875)
					frc r3.z, r3.z
					sincos r1.w, null, r1.w
					mul r1.w, r1.w, l(43758.546875)
					frc r1.w, r1.w
					add r1.z, r1.w, r1.z
					mad r1.y, r1.z, l(0.083333), r1.y
					mad r1.z, r11.x, l(2.000000), r3.y
					mad r3.y, r11.x, l(2.000000), r3.w
					mad r3.y, r11.z, l(-12.000000), r3.y
					mad r1.w, r1.w, l(2.000000), r3.y
					add r1.z, r3.z, r1.z
					mad r11.xyzw, v1.xyxy, l(192.000000, 192.000000, 192.000000, 192.000000), l(-1.000000, 2.000000, 0.000000, 2.000000)
					mad r14.xyzw, r1.xxxx, l(0.130000, 0.130000, 0.130000, 0.130000), r11.xyzw
					dp2 r3.y, r14.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r3.z, r14.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r3.yz, null, r3.yyzy
					mul r3.yz, r3.yyzy, l(0.000000, 43758.546875, 43758.546875, 0.000000)
					frc r3.yz, r3.yyzy
					mad r1.z, r3.y, l(2.000000), r1.z
					add r3.x, r3.y, r3.x
					mad r3.x, r3.z, l(2.000000), r3.x
					add r1.zw, r1.zzzw, r3.zzzz
					mad r1.y, r1.z, l(0.041667), r1.y
					mad r14.xyzw, v1.xyxy, l(192.000000, 192.000000, 192.000000, 192.000000), l(1.000000, 2.000000, 2.000000, 2.000000)
					mad r15.xyzw, r1.xxxx, l(0.130000, 0.130000, 0.130000, 0.130000), r14.xyzw
					dp2 r1.z, r15.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r3.y, r15.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r3.y, null, r3.y
					mul r3.y, r3.y, l(43758.546875)
					frc r3.y, r3.y
					sincos r1.z, null, r1.z
					mul r1.z, r1.z, l(43758.546875)
					frc r1.z, r1.z
					add r3.x, r1.z, r3.x
					mad r1.z, r1.z, l(2.000000), r1.w
					add r1.z, r3.y, r1.z
					mad r1.y, r3.x, l(0.083333), r1.y
					mad r1.y, r1.z, l(0.041667), r1.y
					mul o0.z, r1.y, l(0.062500)
					mad r3.xyzw, r1.xxxx, l(0.070000, 0.070000, 0.070000, 0.070000), r0.xyzw
					mad r0.xyzw, r1.xxxx, l(0.110000, 0.110000, 0.110000, 0.110000), r0.xyzw
					dp2 r1.y, r3.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r1.z, r3.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r1.yz, null, r1.yyzy
					mul r1.yz, r1.yyzy, l(0.000000, 43758.546875, 43758.546875, 0.000000)
					mad r3.xyzw, r1.xxxx, l(0.070000, 0.070000, 0.070000, 0.070000), r2.xyzw
					mad r2.xyzw, r1.xxxx, l(0.110000, 0.110000, 0.110000, 0.110000), r2.xyzw
					dp2 r1.w, r3.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r3.x, r3.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r3.x, null, r3.x
					mul r3.x, r3.x, l(43758.546875)
					frc r3.x, r3.x
					sincos r1.w, null, r1.w
					mul r1.w, r1.w, l(43758.546875)
					frc r1.yzw, r1.yyzw
					mad r1.y, r1.w, l(2.000000), r1.y
					mad r1.w, r3.x, l(2.000000), r1.w
					add r1.y, r3.x, r1.y
					mad r15.xyzw, r1.xxxx, l(0.070000, 0.070000, 0.070000, 0.070000), r4.xyzw
					mad r4.xyzw, r1.xxxx, l(0.110000, 0.110000, 0.110000, 0.110000), r4.xyzw
					dp2 r3.y, r15.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r3.z, r15.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r3.yz, null, r3.yyzy
					mul r3.yz, r3.yyzy, l(0.000000, 43758.546875, 43758.546875, 0.000000)
					frc r3.yz, r3.yyzy
					mad r1.y, r3.y, l(2.000000), r1.y
					mad r3.y, r1.z, l(2.000000), r3.y
					add r3.y, r3.z, r3.y
					mad r1.y, r1.z, l(-12.000000), r1.y
					mad r1.y, r3.z, l(2.000000), r1.y
					mad r15.xyzw, r1.xxxx, l(0.070000, 0.070000, 0.070000, 0.070000), r5.xyzw
					mad r5.xyzw, r1.xxxx, l(0.110000, 0.110000, 0.110000, 0.110000), r5.xyzw
					dp2 r3.w, r15.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r15.x, r15.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r15.x, null, r15.x
					mul r15.x, r15.x, l(43758.546875)
					frc r15.x, r15.x
					sincos r3.w, null, r3.w
					mul r3.w, r3.w, l(43758.546875)
					frc r3.w, r3.w
					add r1.y, r1.y, r3.w
					mad r1.y, r15.x, l(2.000000), r1.y
					dp2 r8.x, r8.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r8.y, r8.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r8.xy, null, r8.xyxx
					mul r8.xy, r8.xyxx, l(43758.546875, 43758.546875, 0.000000, 0.000000)
					frc r8.xy, r8.xyxx
					mad r16.xyzw, r1.xxxx, l(0.070000, 0.070000, 0.070000, 0.070000), r7.xyzw
					mad r7.xyzw, r1.xxxx, l(0.110000, 0.110000, 0.110000, 0.110000), r7.xyzw
					dp2 r8.z, r16.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r8.w, r16.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r8.zw, null, r8.zzzw
					mul r8.zw, r8.zzzw, l(0.000000, 0.000000, 43758.546875, 43758.546875)
					frc r8.zw, r8.zzzw
					add r1.yw, r1.yyyw, r8.xxxz
					mad r3.x, r8.z, l(2.000000), r3.x
					mad r1.w, r1.z, l(2.000000), r1.w
					mad r1.z, r3.z, l(2.000000), r1.z
					add r1.z, r8.w, r1.z
					mad r1.z, r15.x, l(2.000000), r1.z
					mad r1.z, r8.x, l(-12.000000), r1.z
					mad r1.w, r3.z, l(-12.000000), r1.w
					mad r1.w, r8.w, l(2.000000), r1.w
					add r1.w, r15.x, r1.w
					mad r1.w, r8.x, l(2.000000), r1.w
					mad r16.xyzw, r1.xxxx, l(0.070000, 0.070000, 0.070000, 0.070000), r9.xyzw
					mad r9.xyzw, r1.xxxx, l(0.110000, 0.110000, 0.110000, 0.110000), r9.xyzw
					dp2 r8.z, r16.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r15.y, r16.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r15.y, null, r15.y
					mul r15.y, r15.y, l(43758.546875)
					frc r15.y, r15.y
					add r3.x, r3.x, r15.y
					mad r3.x, r3.z, l(2.000000), r3.x
					mad r3.z, r8.w, l(2.000000), r3.z
					mad r3.x, r8.w, l(-12.000000), r3.x
					sincos r8.z, null, r8.z
					mul r8.z, r8.z, l(43758.546875)
					frc r8.z, r8.z
					add r1.w, r1.w, r8.z
					mul r1.w, r1.w, l(0.083333)
					mad r1.y, r1.y, l(0.041667), r1.w
					mad r16.xyzw, r1.xxxx, l(0.070000, 0.070000, 0.070000, 0.070000), r10.xyzw
					mad r10.xyzw, r1.xxxx, l(0.110000, 0.110000, 0.110000, 0.110000), r10.xyzw
					dp2 r1.w, r16.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r8.w, r16.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r8.w, null, r8.w
					mul r8.w, r8.w, l(43758.546875)
					frc r8.w, r8.w
					sincos r1.w, null, r1.w
					mul r1.w, r1.w, l(43758.546875)
					frc r1.w, r1.w
					mad r3.x, r1.w, l(2.000000), r3.x
					add r1.w, r1.w, r3.z
					mad r1.w, r8.x, l(2.000000), r1.w
					mad r1.w, r8.z, l(-12.000000), r1.w
					mad r1.w, r8.w, l(2.000000), r1.w
					add r3.x, r8.x, r3.x
					mad r3.x, r8.z, l(2.000000), r3.x
					add r3.x, r8.w, r3.x
					mad r1.y, r3.x, l(0.041667), r1.y
					mad r3.x, r3.w, l(2.000000), r3.y
					mad r3.y, r15.x, l(2.000000), r3.w
					mad r3.x, r15.x, l(-12.000000), r3.x
					mad r3.z, r8.x, l(2.000000), r15.x
					mad r3.x, r8.x, l(2.000000), r3.x
					mad r3.w, r8.z, l(2.000000), r8.x
					mad r1.z, r8.z, l(2.000000), r1.z
					add r3.yzw, r8.xxzw, r3.yyzw
					mad r15.xyzw, r1.xxxx, l(0.070000, 0.070000, 0.070000, 0.070000), r6.xyzw
					mad r6.xyzw, r1.xxxx, l(0.110000, 0.110000, 0.110000, 0.110000), r6.xyzw
					dp2 r8.x, r15.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r8.z, r15.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r8.xz, null, r8.xxzx
					mul r8.xz, r8.xxzx, l(43758.546875, 0.000000, 43758.546875, 0.000000)
					frc r8.xz, r8.xxzx
					add r3.x, r3.x, r8.x
					mad r3.y, r8.x, l(2.000000), r3.y
					mad r3.y, r8.z, l(-12.000000), r3.y
					mad r3.x, r8.z, l(2.000000), r3.x
					mad r15.xyzw, r1.xxxx, l(0.070000, 0.070000, 0.070000, 0.070000), r12.xyzw
					mad r12.xyzw, r1.xxxx, l(0.110000, 0.110000, 0.110000, 0.110000), r12.xyzw
					dp2 r8.x, r15.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r8.w, r15.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r8.xw, null, r8.xxxw
					mul r8.xw, r8.xxxw, l(43758.546875, 0.000000, 0.000000, 43758.546875)
					frc r8.xw, r8.xxxw
					add r3.x, r3.x, r8.x
					mad r1.y, r3.x, l(0.083333), r1.y
					add r1.z, r1.z, r8.z
					mad r3.x, r8.z, l(2.000000), r3.z
					mad r3.x, r8.x, l(-12.000000), r3.x
					mad r3.x, r8.w, l(2.000000), r3.x
					mad r1.z, r8.x, l(2.000000), r1.z
					add r1.z, r8.w, r1.z
					mad r1.y, r1.z, l(0.166667), r1.y
					add r1.z, r1.w, r8.x
					mad r1.z, r8.w, l(2.000000), r1.z
					mad r15.xyzw, r1.xxxx, l(0.070000, 0.070000, 0.070000, 0.070000), r13.xyzw
					mad r13.xyzw, r1.xxxx, l(0.110000, 0.110000, 0.110000, 0.110000), r13.xyzw
					dp2 r1.w, r15.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r3.z, r15.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r3.z, null, r3.z
					mul r3.z, r3.z, l(43758.546875)
					frc r3.z, r3.z
					sincos r1.w, null, r1.w
					mul r1.w, r1.w, l(43758.546875)
					frc r1.w, r1.w
					add r1.z, r1.w, r1.z
					mad r1.y, r1.z, l(0.083333), r1.y
					mad r1.z, r8.x, l(2.000000), r3.y
					mad r3.y, r8.x, l(2.000000), r3.w
					mad r3.y, r8.w, l(-12.000000), r3.y
					mad r1.w, r1.w, l(2.000000), r3.y
					add r1.z, r3.z, r1.z
					mad r15.xyzw, r1.xxxx, l(0.070000, 0.070000, 0.070000, 0.070000), r11.xyzw
					mad r11.xyzw, r1.xxxx, l(0.110000, 0.110000, 0.110000, 0.110000), r11.xyzw
					dp2 r3.y, r15.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r3.z, r15.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r3.yz, null, r3.yyzy
					mul r3.yz, r3.yyzy, l(0.000000, 43758.546875, 43758.546875, 0.000000)
					frc r3.yz, r3.yyzy
					mad r1.z, r3.y, l(2.000000), r1.z
					add r3.x, r3.y, r3.x
					mad r3.x, r3.z, l(2.000000), r3.x
					add r1.zw, r1.zzzw, r3.zzzz
					mad r1.y, r1.z, l(0.041667), r1.y
					mad r15.xyzw, r1.xxxx, l(0.070000, 0.070000, 0.070000, 0.070000), r14.xyzw
					mad r14.xyzw, r1.xxxx, l(0.110000, 0.110000, 0.110000, 0.110000), r14.xyzw
					dp2 r1.x, r15.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r1.z, r15.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r1.xz, null, r1.xxzx
					mul r1.xz, r1.xxzx, l(43758.546875, 0.000000, 43758.546875, 0.000000)
					frc r1.xz, r1.xxzx
					add r3.x, r1.x, r3.x
					mad r1.x, r1.x, l(2.000000), r1.w
					add r1.x, r1.z, r1.x
					mad r1.y, r3.x, l(0.083333), r1.y
					mad r1.x, r1.x, l(0.041667), r1.y
					mul o0.x, r1.x, l(0.062500)
					dp2 r0.x, r0.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r0.y, r0.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r0.xy, null, r0.xyxx
					mul r0.xy, r0.xyxx, l(43758.546875, 43758.546875, 0.000000, 0.000000)
					dp2 r0.z, r2.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r0.w, r2.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r0.zw, null, r0.zzzw
					mul r0.zw, r0.zzzw, l(0.000000, 0.000000, 43758.546875, 43758.546875)
					frc r0.xyzw, r0.xyzw
					mad r0.x, r0.z, l(2.000000), r0.x
					mad r0.z, r0.w, l(2.000000), r0.z
					add r0.x, r0.w, r0.x
					dp2 r1.x, r4.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r1.y, r4.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r1.xy, null, r1.xyxx
					mul r1.xy, r1.xyxx, l(43758.546875, 43758.546875, 0.000000, 0.000000)
					frc r1.xy, r1.xyxx
					mad r0.x, r1.x, l(2.000000), r0.x
					mad r1.x, r0.y, l(2.000000), r1.x
					add r1.x, r1.y, r1.x
					mad r0.x, r0.y, l(-12.000000), r0.x
					mad r0.x, r1.y, l(2.000000), r0.x
					dp2 r1.z, r5.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r1.w, r5.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r1.zw, null, r1.zzzw
					mul r1.zw, r1.zzzw, l(0.000000, 0.000000, 43758.546875, 43758.546875)
					frc r1.zw, r1.zzzw
					add r0.x, r0.x, r1.z
					mad r0.x, r1.w, l(2.000000), r0.x
					add r0.x, r8.y, r0.x
					dp2 r2.x, r7.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r2.y, r7.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r2.xy, null, r2.xyxx
					mul r2.xy, r2.xyxx, l(43758.546875, 43758.546875, 0.000000, 0.000000)
					frc r2.xy, r2.xyxx
					add r0.z, r0.z, r2.x
					mad r0.w, r2.x, l(2.000000), r0.w
					mad r0.z, r0.y, l(2.000000), r0.z
					mad r0.y, r1.y, l(2.000000), r0.y
					add r0.y, r2.y, r0.y
					mad r0.y, r1.w, l(2.000000), r0.y
					mad r0.y, r8.y, l(-12.000000), r0.y
					mad r0.z, r1.y, l(-12.000000), r0.z
					mad r0.z, r2.y, l(2.000000), r0.z
					add r0.z, r1.w, r0.z
					mad r0.z, r8.y, l(2.000000), r0.z
					dp2 r2.x, r9.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r2.z, r9.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r2.xz, null, r2.xxzx
					mul r2.xz, r2.xxzx, l(43758.546875, 0.000000, 43758.546875, 0.000000)
					frc r2.xz, r2.xxzx
					add r0.zw, r0.zzzw, r2.xxxz
					mad r0.w, r1.y, l(2.000000), r0.w
					mad r1.y, r2.y, l(2.000000), r1.y
					mad r0.w, r2.y, l(-12.000000), r0.w
					mul r0.z, r0.z, l(0.083333)
					mad r0.x, r0.x, l(0.041667), r0.z
					dp2 r0.z, r10.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r2.y, r10.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r2.y, null, r2.y
					mul r2.y, r2.y, l(43758.546875)
					frc r2.y, r2.y
					sincos r0.z, null, r0.z
					mul r0.z, r0.z, l(43758.546875)
					frc r0.z, r0.z
					mad r0.w, r0.z, l(2.000000), r0.w
					add r0.z, r0.z, r1.y
					mad r0.z, r8.y, l(2.000000), r0.z
					mad r0.z, r2.x, l(-12.000000), r0.z
					mad r0.z, r2.y, l(2.000000), r0.z
					add r0.w, r8.y, r0.w
					mad r0.w, r2.x, l(2.000000), r0.w
					add r0.w, r2.y, r0.w
					mad r0.x, r0.w, l(0.041667), r0.x
					mad r0.w, r1.z, l(2.000000), r1.x
					mad r1.x, r1.w, l(2.000000), r1.z
					add r1.x, r8.y, r1.x
					mad r0.w, r1.w, l(-12.000000), r0.w
					mad r1.y, r8.y, l(2.000000), r1.w
					mad r0.w, r8.y, l(2.000000), r0.w
					mad r1.z, r2.x, l(2.000000), r8.y
					mad r0.y, r2.x, l(2.000000), r0.y
					add r1.yz, r2.xxyx, r1.yyzy
					dp2 r1.w, r6.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r2.x, r6.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r2.x, null, r2.x
					mul r2.x, r2.x, l(43758.546875)
					frc r2.x, r2.x
					sincos r1.w, null, r1.w
					mul r1.w, r1.w, l(43758.546875)
					frc r1.w, r1.w
					add r0.w, r0.w, r1.w
					mad r1.x, r1.w, l(2.000000), r1.x
					mad r1.x, r2.x, l(-12.000000), r1.x
					mad r0.w, r2.x, l(2.000000), r0.w
					dp2 r1.w, r12.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r2.y, r12.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r2.y, null, r2.y
					mul r2.y, r2.y, l(43758.546875)
					frc r2.y, r2.y
					sincos r1.w, null, r1.w
					mul r1.w, r1.w, l(43758.546875)
					frc r1.w, r1.w
					add r0.w, r0.w, r1.w
					mad r0.x, r0.w, l(0.083333), r0.x
					add r0.y, r0.y, r2.x
					mad r0.w, r2.x, l(2.000000), r1.y
					mad r0.w, r1.w, l(-12.000000), r0.w
					mad r0.w, r2.y, l(2.000000), r0.w
					mad r0.y, r1.w, l(2.000000), r0.y
					add r0.y, r2.y, r0.y
					mad r0.x, r0.y, l(0.166667), r0.x
					add r0.y, r0.z, r1.w
					mad r0.y, r2.y, l(2.000000), r0.y
					dp2 r0.z, r13.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r1.y, r13.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r1.y, null, r1.y
					mul r1.y, r1.y, l(43758.546875)
					frc r1.y, r1.y
					sincos r0.z, null, r0.z
					mul r0.z, r0.z, l(43758.546875)
					frc r0.z, r0.z
					add r0.y, r0.z, r0.y
					mad r0.x, r0.y, l(0.083333), r0.x
					mad r0.y, r1.w, l(2.000000), r1.x
					mad r1.x, r1.w, l(2.000000), r1.z
					mad r1.x, r2.y, l(-12.000000), r1.x
					mad r0.z, r0.z, l(2.000000), r1.x
					add r0.y, r1.y, r0.y
					dp2 r1.x, r11.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r1.y, r11.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r1.xy, null, r1.xyxx
					mul r1.xy, r1.xyxx, l(43758.546875, 43758.546875, 0.000000, 0.000000)
					frc r1.xy, r1.xyxx
					mad r0.y, r1.x, l(2.000000), r0.y
					add r0.yzw, r0.yyzw, r1.yyyx
					mad r0.w, r1.y, l(2.000000), r0.w
					mad r0.x, r0.y, l(0.041667), r0.x
					dp2 r0.y, r14.xyxx, l(12.989800, 78.233002, 0.000000, 0.000000)
					dp2 r1.x, r14.zwzz, l(12.989800, 78.233002, 0.000000, 0.000000)
					sincos r1.x, null, r1.x
					mul r1.x, r1.x, l(43758.546875)
					frc r1.x, r1.x
					sincos r0.y, null, r0.y
					mul r0.y, r0.y, l(43758.546875)
					frc r0.y, r0.y
					add r0.w, r0.y, r0.w
					mad r0.y, r0.y, l(2.000000), r0.z
					add r0.y, r1.x, r0.y
					mad r0.x, r0.w, l(0.083333), r0.x
					mad r0.x, r0.y, l(0.041667), r0.x
					mul o0.y, r0.x, l(0.062500)
					mov o0.w, l(1.000000)
					ret 
					// Approximately 0 instruction slots used"
				}
			}
		}
	}
}