/*****************************************************************************
* (c) Copyright  Actel Corporation. All rights reserved.
*
*ACE configuration .c file
*Created by Actel MSS_ACE Configurator Tue Mar 13 14:24:47 2018
*
*/

#include "../../drivers/mss_ace/mss_ace_configurator.h"
#include "ace_config.h"
#include "ace_handles.h"

#include <stdint.h>


#ifdef __cplusplus
extern "C" {
#endif

/*-----------------------------------------------------------------------------
*AB Configuration
*---------------------------------------------------------------------------*/
ace_adc_config_t g_ace_adc_config[ACE_NB_OF_ADC] = 
{
	{
        4096,                      /* uint16_t adc_resolution */
        2560                       /* uint16_t va_ref */
	},
	{
        4096,                      /* uint16_t adc_resolution */
        2560                       /* uint16_t va_ref */
	}
};

/*-----------------------------------------------------------------------------
*Current Monitor External Resistor Value ( milli-ohms )
*---------------------------------------------------------------------------*/
const uint16_t g_ace_current_resistors[ACE_NB_OF_CURRENT_MONITORS] = 
{
	1,	/*CM0 ( NOT USED AS CURRENT MONITOR ) */
	1,	/*CM1 ( NOT USED AS CURRENT MONITOR ) */
	1,	/*CM2 ( NOT USED AS CURRENT MONITOR ) */
	1	/*CM3 ( NOT USED AS CURRENT MONITOR ) */
};

/*-----------------------------------------------------------------------------
*External VAREF usage
*---------------------------------------------------------------------------*/
const uint8_t g_ace_external_varef_used[ACE_NB_OF_ADC] = 
{
	0,
	0
};

/*-----------------------------------------------------------------------------
*Analog Channels
*---------------------------------------------------------------------------*/
/* Names*/
const uint8_t g_ace_channel_0_name[] = "TM0_Voltage";

/* Number of Flags per Channel*/
#define CHANNEL_0_NB_OF_FLAGS           4

/* Input Channel to Flag Array Association*/
const uint16_t g_channel_0_flags_lut[CHANNEL_0_NB_OF_FLAGS] = { 0, 1, 2, 3 };

/* Channel Table*/
ace_channel_desc_t g_ace_channel_desc_table[ACE_NB_OF_INPUT_CHANNELS] = 
{
	{
        g_ace_channel_0_name,      /* const uint8_t * p_sz_channel_name */
        TM0,                       /* adc_channel_id_t signal_id; */
        16,                        /* uint16_t signal_ppe_offset */
        CHANNEL_0_NB_OF_FLAGS,     /* uint16_t nb_of_flags */
        g_channel_0_flags_lut      /* uint16_t * p_flags_array */
	}
};

/*-----------------------------------------------------------------------------
*Threshold Flags
*---------------------------------------------------------------------------*/
/* Flag Names*/
const uint8_t g_ace_ppe_flag_0_name[] = "TM0_Voltage:over_1p0v";
const uint8_t g_ace_ppe_flag_1_name[] = "TM0_Voltage:over_1p5v";
const uint8_t g_ace_ppe_flag_2_name[] = "TM0_Voltage:over_2p0v";
const uint8_t g_ace_ppe_flag_3_name[] = "TM0_Voltage:over_2p5v";
/* Flag Table*/
ppe_flag_desc_t g_ppe_flags_desc_table[ACE_NB_OF_PPE_FLAGS] = 
{
	{
        g_ace_ppe_flag_0_name,     /* const uint8_t * p_sz_flag_name */
        PPE_FLAGS0_0,              /* ppe_flag_id_t flag_id */
        DUAL_HYSTERESIS_OVER,      /* uint8_t flag_type */
        25,                        /* uint16_t threshold_ppe_offset */
        1600,                      /* uint16_t default_threshold */
        2,                         /* uint16_t flag_properties default_hysteresis */
        TM0_Voltage                /* ace_channel_handle_t channel_handle */
	},
	{
        g_ace_ppe_flag_1_name,     /* const uint8_t * p_sz_flag_name */
        PPE_FLAGS0_1,              /* ppe_flag_id_t flag_id */
        DUAL_HYSTERESIS_OVER,      /* uint8_t flag_type */
        27,                        /* uint16_t threshold_ppe_offset */
        2400,                      /* uint16_t default_threshold */
        2,                         /* uint16_t flag_properties default_hysteresis */
        TM0_Voltage                /* ace_channel_handle_t channel_handle */
	},
	{
        g_ace_ppe_flag_2_name,     /* const uint8_t * p_sz_flag_name */
        PPE_FLAGS0_2,              /* ppe_flag_id_t flag_id */
        DUAL_HYSTERESIS_OVER,      /* uint8_t flag_type */
        29,                        /* uint16_t threshold_ppe_offset */
        3200,                      /* uint16_t default_threshold */
        2,                         /* uint16_t flag_properties default_hysteresis */
        TM0_Voltage                /* ace_channel_handle_t channel_handle */
	},
	{
        g_ace_ppe_flag_3_name,     /* const uint8_t * p_sz_flag_name */
        PPE_FLAGS0_3,              /* ppe_flag_id_t flag_id */
        DUAL_HYSTERESIS_OVER,      /* uint8_t flag_type */
        31,                        /* uint16_t threshold_ppe_offset */
        4000,                      /* uint16_t default_threshold */
        2,                         /* uint16_t flag_properties default_hysteresis */
        TM0_Voltage                /* ace_channel_handle_t channel_handle */
	}
};

/*-----------------------------------------------------------------------------
*PPE Linear Transforms
*---------------------------------------------------------------------------*/
const ppe_transforms_desc_t g_ace_ppe_transforms_desc_table[ACE_NB_OF_INPUT_CHANNELS] = 
{
	{
        18,                        /* uint16_t    m_ppe_offset */
        19,                        /* uint16_t    c_ppe_offset */
        0x4000,                    /* int16_t     default_m2 */
        0x0000                     /* int16_t     default_c2 */
	}
};

/*-----------------------------------------------------------------------------
*Sequencer Procedures
*---------------------------------------------------------------------------*/
/* Procedure Name and Microcode*/
const uint8_t g_ace_sse_proc_0_name[] = "ADC0_MAIN";
const uint16_t g_ace_sse_proc_0_sequence[] = 
{
	0x1705, 0x1601, 0x1562, 0x14c4, 
	0x0000, 0x1002 
};

const uint8_t g_ace_sse_proc_1_name[] = "ADC1_MAIN";
const uint16_t g_ace_sse_proc_1_sequence[] = 
{
	0x2705, 0x2601, 0x2200 
};



/* Procedure Table*/
ace_procedure_desc_t g_sse_sequences_desc_table[ACE_NB_OF_SSE_PROCEDURES] = 
{
	{
        g_ace_sse_proc_0_name,                              /* const uint8_t * p_sz_proc_name */
        2,                                                  /* uint16_t sse_loop_pc */
        0,                                                  /* uint16_t sse_load_offset */
        sizeof(g_ace_sse_proc_0_sequence) / sizeof(uint16_t), /* uint16_t sse_ucode_length */
        g_ace_sse_proc_0_sequence,                          /* const uint16_t * sse_ucode */
        0                                                   /* uint8_t sse_pc_id */
	},
	{
        g_ace_sse_proc_1_name,                              /* const uint8_t * p_sz_proc_name */
        8,                                                  /* uint16_t sse_loop_pc */
        6,                                                  /* uint16_t sse_load_offset */
        sizeof(g_ace_sse_proc_1_sequence) / sizeof(uint16_t), /* uint16_t sse_ucode_length */
        g_ace_sse_proc_1_sequence,                          /* const uint16_t * sse_ucode */
        1                                                   /* uint8_t sse_pc_id */
	}
};


#ifdef __cplusplus
}
#endif

