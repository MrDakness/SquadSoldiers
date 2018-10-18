Shader "DeepSky Haze/Standard Transparent - Lighting Only" {
	Properties {
		_Color ("Color", Vector) = (1,1,1,1)
		_MainTex ("Albedo (RGB)", 2D) = "white" {}
		[NoScaleOffset] _MetallicGloss ("Metal (R), Smoothness (A)", 2D) = "black" {}
		[NoScaleOffset] [Normal] _Normal ("Normal Map", 2D) = "bump" {}
		_Metallic ("Metallic", Range(0, 1)) = 0
		_Gloss ("Gloss", Range(0, 1)) = 0.2
	}
	SubShader {
		LOD 200
		Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
		Pass {
			LOD 200
			Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
			Fog {
				Mode Off
			}
			GpuProgramID 11839
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
					// POSITION                 0   xyz         0     NONE   float   xyz 
					// COLOR                    0   xyzw        1     NONE   float   xyzw
					//
					//
					// Output signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// COLOR                    0   xyzw        0     NONE   float   xyzw
					// SV_POSITION              0   xyzw        1      POS   float   xyzw
					//
					vs_4_0
					dcl_constantbuffer CB0[4], immediateIndexed
					dcl_constantbuffer CB1[21], immediateIndexed
					dcl_input v0.xyz
					dcl_input v1.xyzw
					dcl_output o0.xyzw
					dcl_output_siv o1.xyzw, position
					dcl_temps 2
					mov_sat o0.xyzw, v1.xyzw
					mul r0.xyzw, v0.yyyy, cb0[1].xyzw
					mad r0.xyzw, cb0[0].xyzw, v0.xxxx, r0.xyzw
					mad r0.xyzw, cb0[2].xyzw, v0.zzzz, r0.xyzw
					add r0.xyzw, r0.xyzw, cb0[3].xyzw
					mul r1.xyzw, r0.yyyy, cb1[18].xyzw
					mad r1.xyzw, cb1[17].xyzw, r0.xxxx, r1.xyzw
					mad r1.xyzw, cb1[19].xyzw, r0.zzzz, r1.xyzw
					mad o1.xyzw, cb1[20].xyzw, r0.wwww, r1.xyzw
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
					// COLOR                    0   xyzw        0     NONE   float   xyzw
					// SV_POSITION              0   xyzw        1      POS   float       
					//
					//
					// Output signature:
					//
					// Name                 Index   Mask Register SysValue  Format   Used
					// -------------------- ----- ------ -------- -------- ------- ------
					// SV_Target                0   xyzw        0   TARGET   float   xyzw
					//
					ps_4_0
					dcl_input_ps linear v0.xyzw
					dcl_output o0.xyzw
					mov o0.xyzw, v0.xyzw
					ret 
					// Approximately 0 instruction slots used"
				}
			}
		}
	}
	Fallback "Diffuse"
	CustomEditor "DeepSky.Haze.DS_TransparentGUI"
}