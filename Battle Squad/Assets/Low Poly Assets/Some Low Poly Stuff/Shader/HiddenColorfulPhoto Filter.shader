Shader "Hidden/Colorful/Photo Filter" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_RGB ("Levels", Vector) = (1,0.5,0.2,1)
		_Density ("Density", Range(0, 1)) = 0.35
	}
	SubShader {
		Pass {
			ZTest Always
			ZWrite Off
			Cull Off
			Fog {
				Mode Off
			}
			GpuProgramID 57447
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
					// TEXCOORD                 0   xy          1     NONE   float   xy  
					//
					//
					// Output signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// SV_POSITION              0   xyzw        0      POS   float   xyzw
					// TEXCOORD                 0   xy          1     NONE   float   xy  
					//
					vs_4_0
					dcl_constantbuffer CB0[4], immediateIndexed
					dcl_constantbuffer CB1[21], immediateIndexed
					dcl_input v0.xyz
					dcl_input v1.xy
					dcl_output_siv o0.xyzw, position
					dcl_output o1.xy
					dcl_temps 2
					mul r0.xyzw, v0.yyyy, cb0[1].xyzw
					mad r0.xyzw, cb0[0].xyzw, v0.xxxx, r0.xyzw
					mad r0.xyzw, cb0[2].xyzw, v0.zzzz, r0.xyzw
					add r0.xyzw, r0.xyzw, cb0[3].xyzw
					mul r1.xyzw, r0.yyyy, cb1[18].xyzw
					mad r1.xyzw, cb1[17].xyzw, r0.xxxx, r1.xyzw
					mad r1.xyzw, cb1[19].xyzw, r0.zzzz, r1.xyzw
					mad o0.xyzw, cb1[20].xyzw, r0.wwww, r1.xyzw
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
					dcl_sampler s0, mode_default
					dcl_resource_texture2d (float,float,float,float) t0
					dcl_input_ps linear v1.xy
					dcl_output o0.xyzw
					dcl_temps 4
					sample r0.xyzw, v1.xyxx, t0.xyzw, s0
					dp3 r1.x, r0.xyzx, l(0.222000, 0.707000, 0.071000, 0.000000)
					add_sat r1.y, r1.x, l(-0.500000)
					add r1.y, r1.y, r1.y
					add_sat r1.z, r1.x, r1.x
					mul_sat r1.x, r1.x, cb0[4].x
					mul r2.xyz, r1.zzzz, cb0[3].xyzx
					mad r3.xyz, -r1.zzzz, cb0[3].xyzx, l(1.000000, 1.000000, 1.000000, 0.000000)
					mad r1.yzw, r1.yyyy, r3.xxyz, r2.xxyz
					add r1.yzw, -r0.xxyz, r1.yyzw
					mad o0.xyz, r1.xxxx, r1.yzwy, r0.xyzx
					mov o0.w, r0.w
					ret 
					// Approximately 0 instruction slots used"
				}
			}
		}
	}
}