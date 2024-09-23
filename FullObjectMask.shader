Shader "Custom/FullObjectMask"
{
    Properties
    {
        [HideInInspector] _StencilRef("Stencil Ref", Int) = 1
    }

    SubShader
    {
        Tags {"Queue"="Geometry-1" "RenderType"="Opaque" "RenderPipeline"="UniversalPipeline"}

        Pass
        {
            Name "Mask"
            Cull Back
            ZWrite Off
            ColorMask 0

            Stencil
            {
                Ref [_StencilRef]
                Comp Always
                Pass Replace
            }

            HLSLPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

            struct Attributes
            {
                float4 positionOS : POSITION;
            };

            struct Varyings
            {
                float4 positionCS : SV_POSITION;
            };

            Varyings vert(Attributes IN)
            {
                Varyings OUT;
                OUT.positionCS = TransformObjectToHClip(IN.positionOS.xyz);
                return OUT;
            }

            half4 frag() : SV_Target
            {
                return 0;
            }
            ENDHLSL
        }
    }
}