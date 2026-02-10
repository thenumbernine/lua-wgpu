local ffi = require 'ffi'
require 'ffi.req' 'c.stdint'
require 'ffi.req' 'c.stddef'
require 'ffi.req' 'c.math'
ffi.cdef[[
/* + BEGIN <webgpu/webgpu.h> /usr/local/include/webgpu/webgpu.h */
typedef struct WGPUStringView {
    char const * data;
    size_t length;
} WGPUStringView ;
typedef uint64_t WGPUFlags;
typedef uint32_t WGPUBool;
typedef struct WGPUAdapterImpl* WGPUAdapter ;
typedef struct WGPUBindGroupImpl* WGPUBindGroup ;
typedef struct WGPUBindGroupLayoutImpl* WGPUBindGroupLayout ;
typedef struct WGPUBufferImpl* WGPUBuffer ;
typedef struct WGPUCommandBufferImpl* WGPUCommandBuffer ;
typedef struct WGPUComputePipelineImpl* WGPUComputePipeline ;
typedef struct WGPUDeviceImpl* WGPUDevice ;
typedef struct WGPUExternalTextureImpl* WGPUExternalTexture ;
typedef struct WGPUInstanceImpl* WGPUInstance ;
typedef struct WGPUPipelineLayoutImpl* WGPUPipelineLayout ;
typedef struct WGPUQuerySetImpl* WGPUQuerySet ;
typedef struct WGPUQueueImpl* WGPUQueue ;
typedef struct WGPURenderBundleImpl* WGPURenderBundle ;
typedef struct WGPURenderPipelineImpl* WGPURenderPipeline ;
typedef struct WGPUResourceTableImpl* WGPUResourceTable ;
typedef struct WGPUSamplerImpl* WGPUSampler ;
typedef struct WGPUShaderModuleImpl* WGPUShaderModule ;
typedef struct WGPUSharedBufferMemoryImpl* WGPUSharedBufferMemory ;
typedef struct WGPUSharedFenceImpl* WGPUSharedFence ;
typedef struct WGPUSharedTextureMemoryImpl* WGPUSharedTextureMemory ;
typedef struct WGPUSurfaceImpl* WGPUSurface ;
typedef struct WGPUTexelBufferViewImpl* WGPUTexelBufferView ;
typedef struct WGPUTextureImpl* WGPUTexture ;
typedef struct WGPUTextureViewImpl* WGPUTextureView ;
typedef struct WGPUCommandEncoderImpl* WGPUCommandEncoder ;
typedef struct WGPUComputePassEncoderImpl* WGPUComputePassEncoder ;
typedef struct WGPURenderBundleEncoderImpl* WGPURenderBundleEncoder ;
typedef struct WGPURenderPassEncoderImpl* WGPURenderPassEncoder ;
struct WGPUAdapterPropertiesD3D;
struct WGPUAdapterPropertiesVk;
struct WGPUAdapterPropertiesWGPU;
struct WGPUBindingResource;
struct WGPUBlendComponent;
struct WGPUBufferBindingLayout;
struct WGPUBufferHostMappedPointer;
struct WGPUColor;
struct WGPUColorTargetStateExpandResolveTextureDawn;
struct WGPUCommandBufferDescriptor;
struct WGPUCompatibilityModeLimits;
struct WGPUConstantEntry;
struct WGPUCopyTextureForBrowserOptions;
struct WGPUDawnAdapterPropertiesPowerPreference;
struct WGPUDawnBufferDescriptorErrorInfoFromWireClient;
struct WGPUDawnCacheDeviceDescriptor;
struct WGPUDawnCompilationMessageUtf16;
struct WGPUDawnConsumeAdapterDescriptor;
struct WGPUDawnDeviceAllocatorControl;
struct WGPUDawnDrmFormatProperties;
struct WGPUDawnEncoderInternalUsageDescriptor;
struct WGPUDawnFakeBufferOOMForTesting;
struct WGPUDawnFakeDeviceInitializeErrorForTesting;
struct WGPUDawnHostMappedPointerLimits;
struct WGPUDawnInjectedInvalidSType;
struct WGPUDawnRenderPassColorAttachmentRenderToSingleSampled;
struct WGPUDawnShaderModuleSPIRVOptionsDescriptor;
struct WGPUDawnTexelCopyBufferRowAlignmentLimits;
struct WGPUDawnTextureInternalUsageDescriptor;
struct WGPUDawnTogglesDescriptor;
struct WGPUDawnWGSLBlocklist;
struct WGPUDawnWireWGSLControl;
struct WGPUEmscriptenSurfaceSourceCanvasHTMLSelector;
struct WGPUExtent2D;
struct WGPUExtent3D;
struct WGPUExternalTextureBindingEntry;
struct WGPUExternalTextureBindingLayout;
struct WGPUFuture;
struct WGPUInstanceLimits;
struct WGPUINTERNAL_HAVE_EMDAWNWEBGPU_HEADER;
struct WGPUMemoryHeapInfo;
struct WGPUMultisampleState;
struct WGPUOrigin2D;
struct WGPUOrigin3D;
struct WGPUPassTimestampWrites;
struct WGPUPipelineLayoutResourceTable;
struct WGPUPipelineLayoutStorageAttachment;
struct WGPUPrimitiveState;
struct WGPUQuerySetDescriptor;
struct WGPUQueueDescriptor;
struct WGPURenderBundleDescriptor;
struct WGPURenderBundleEncoderDescriptor;
struct WGPURenderPassDepthStencilAttachment;
struct WGPURenderPassDescriptorExpandResolveRect;
struct WGPURenderPassDescriptorResolveRect;
struct WGPURenderPassMaxDrawCount;
struct WGPURequestAdapterWebGPUBackendOptions;
struct WGPURequestAdapterWebXROptions;
struct WGPUResourceTableDescriptor;
struct WGPUResourceTableLimits;
struct WGPUSamplerBindingLayout;
struct WGPUShaderModuleCompilationOptions;
struct WGPUShaderSourceSPIRV;
struct WGPUShaderSourceWGSL;
struct WGPUSharedBufferMemoryBeginAccessDescriptor;
struct WGPUSharedBufferMemoryDescriptor;
struct WGPUSharedBufferMemoryEndAccessState;
struct WGPUSharedBufferMemoryProperties;
struct WGPUSharedFenceDXGISharedHandleDescriptor;
struct WGPUSharedFenceDXGISharedHandleExportInfo;
struct WGPUSharedFenceEGLSyncDescriptor;
struct WGPUSharedFenceEGLSyncExportInfo;
struct WGPUSharedFenceMTLSharedEventDescriptor;
struct WGPUSharedFenceMTLSharedEventExportInfo;
struct WGPUSharedFenceSyncFDDescriptor;
struct WGPUSharedFenceSyncFDExportInfo;
struct WGPUSharedFenceVkSemaphoreOpaqueFDDescriptor;
struct WGPUSharedFenceVkSemaphoreOpaqueFDExportInfo;
struct WGPUSharedFenceVkSemaphoreZirconHandleDescriptor;
struct WGPUSharedFenceVkSemaphoreZirconHandleExportInfo;
struct WGPUSharedTextureMemoryAHardwareBufferDescriptor;
struct WGPUSharedTextureMemoryD3D11BeginState;
struct WGPUSharedTextureMemoryD3DSwapchainBeginState;
struct WGPUSharedTextureMemoryDmaBufPlane;
struct WGPUSharedTextureMemoryDXGISharedHandleDescriptor;
struct WGPUSharedTextureMemoryEGLImageDescriptor;
struct WGPUSharedTextureMemoryIOSurfaceDescriptor;
struct WGPUSharedTextureMemoryOpaqueFDDescriptor;
struct WGPUSharedTextureMemoryVkDedicatedAllocationDescriptor;
struct WGPUSharedTextureMemoryVkImageLayoutBeginState;
struct WGPUSharedTextureMemoryVkImageLayoutEndState;
struct WGPUSharedTextureMemoryZirconHandleDescriptor;
struct WGPUStaticSamplerBindingLayout;
struct WGPUStencilFaceState;
struct WGPUStorageTextureBindingLayout;
struct WGPUSubgroupMatrixConfig;
struct WGPUSupportedFeatures;
struct WGPUSupportedInstanceFeatures;
struct WGPUSupportedWGSLLanguageFeatures;
struct WGPUSurfaceCapabilities;
struct WGPUSurfaceColorManagement;
struct WGPUSurfaceConfiguration;
struct WGPUSurfaceDescriptorFromWindowsCoreWindow;
struct WGPUSurfaceDescriptorFromWindowsUWPSwapChainPanel;
struct WGPUSurfaceDescriptorFromWindowsWinUISwapChainPanel;
struct WGPUSurfaceSourceAndroidNativeWindow;
struct WGPUSurfaceSourceMetalLayer;
struct WGPUSurfaceSourceWaylandSurface;
struct WGPUSurfaceSourceWindowsHWND;
struct WGPUSurfaceSourceXCBWindow;
struct WGPUSurfaceSourceXlibWindow;
struct WGPUSurfaceTexture;
struct WGPUTexelBufferBindingEntry;
struct WGPUTexelBufferBindingLayout;
struct WGPUTexelBufferViewDescriptor;
struct WGPUTexelCopyBufferLayout;
struct WGPUTextureBindingLayout;
struct WGPUTextureBindingViewDimensionDescriptor;
struct WGPUTextureComponentSwizzle;
struct WGPUVertexAttribute;
struct WGPUYCbCrVkDescriptor;
struct WGPUAdapterPropertiesMemoryHeaps;
struct WGPUAdapterPropertiesSubgroupMatrixConfigs;
struct WGPUAHardwareBufferProperties;
struct WGPUBindGroupEntry;
struct WGPUBindGroupLayoutEntry;
struct WGPUBlendState;
struct WGPUBufferDescriptor;
struct WGPUCommandEncoderDescriptor;
struct WGPUCompilationMessage;
struct WGPUComputePassDescriptor;
struct WGPUComputeState;
struct WGPUDawnDrmFormatCapabilities;
struct WGPUDepthStencilState;
struct WGPUExternalTextureDescriptor;
struct WGPUFutureWaitInfo;
struct WGPUImageCopyExternalTexture;
struct WGPUInstanceDescriptor;
struct WGPULimits;
struct WGPUPipelineLayoutPixelLocalStorage;
struct WGPURenderPassColorAttachment;
struct WGPURenderPassStorageAttachment;
struct WGPURequestAdapterOptions;
struct WGPUSamplerDescriptor;
struct WGPUShaderModuleDescriptor;
struct WGPUSharedFenceDescriptor;
struct WGPUSharedFenceExportInfo;
struct WGPUSharedTextureMemoryAHardwareBufferProperties;
struct WGPUSharedTextureMemoryBeginAccessDescriptor;
struct WGPUSharedTextureMemoryDmaBufDescriptor;
struct WGPUSharedTextureMemoryMetalEndAccessState;
struct WGPUSurfaceDescriptor;
struct WGPUTexelCopyBufferInfo;
struct WGPUTexelCopyTextureInfo;
struct WGPUTextureComponentSwizzleDescriptor;
struct WGPUTextureDescriptor;
struct WGPUVertexBufferLayout;
struct WGPUAdapterInfo;
struct WGPUBindGroupDescriptor;
struct WGPUBindGroupLayoutDescriptor;
struct WGPUColorTargetState;
struct WGPUCompilationInfo;
struct WGPUComputePipelineDescriptor;
struct WGPUDawnFormatCapabilities;
struct WGPUDeviceDescriptor;
struct WGPUPipelineLayoutDescriptor;
struct WGPURenderPassPixelLocalStorage;
struct WGPUSharedTextureMemoryDescriptor;
struct WGPUSharedTextureMemoryEndAccessState;
struct WGPUSharedTextureMemoryProperties;
struct WGPUTextureViewDescriptor;
struct WGPUVertexState;
struct WGPUFragmentState;
struct WGPURenderPassDescriptor;
struct WGPURenderPipelineDescriptor;
struct WGPUBufferMapCallbackInfo;
struct WGPUCompilationInfoCallbackInfo;
struct WGPUCreateComputePipelineAsyncCallbackInfo;
struct WGPUCreateRenderPipelineAsyncCallbackInfo;
struct WGPUDeviceLostCallbackInfo;
struct WGPULoggingCallbackInfo;
struct WGPUPopErrorScopeCallbackInfo;
struct WGPUQueueWorkDoneCallbackInfo;
struct WGPURequestAdapterCallbackInfo;
struct WGPURequestDeviceCallbackInfo;
struct WGPUUncapturedErrorCallbackInfo;
typedef enum WGPUAdapterType {
    WGPUAdapterType_DiscreteGPU = 0x00000001,
    WGPUAdapterType_IntegratedGPU = 0x00000002,
    WGPUAdapterType_CPU = 0x00000003,
    WGPUAdapterType_Unknown = 0x00000004,
    WGPUAdapterType_Force32 = 0x7FFFFFFF
} WGPUAdapterType ;
typedef enum WGPUAddressMode {
    WGPUAddressMode_Undefined = 0x00000000,
    WGPUAddressMode_ClampToEdge = 0x00000001,
    WGPUAddressMode_Repeat = 0x00000002,
    WGPUAddressMode_MirrorRepeat = 0x00000003,
    WGPUAddressMode_Force32 = 0x7FFFFFFF
} WGPUAddressMode ;
typedef enum WGPUAlphaMode {
    WGPUAlphaMode_Opaque = 0x00000001,
    WGPUAlphaMode_Premultiplied = 0x00000002,
    WGPUAlphaMode_Unpremultiplied = 0x00000003,
    WGPUAlphaMode_Force32 = 0x7FFFFFFF
} WGPUAlphaMode ;
typedef enum WGPUBackendType {
    WGPUBackendType_Undefined = 0x00000000,
    WGPUBackendType_Null = 0x00000001,
    WGPUBackendType_WebGPU = 0x00000002,
    WGPUBackendType_D3D11 = 0x00000003,
    WGPUBackendType_D3D12 = 0x00000004,
    WGPUBackendType_Metal = 0x00000005,
    WGPUBackendType_Vulkan = 0x00000006,
    WGPUBackendType_OpenGL = 0x00000007,
    WGPUBackendType_OpenGLES = 0x00000008,
    WGPUBackendType_Force32 = 0x7FFFFFFF
} WGPUBackendType ;
typedef enum WGPUBlendFactor {
    WGPUBlendFactor_Undefined = 0x00000000,
    WGPUBlendFactor_Zero = 0x00000001,
    WGPUBlendFactor_One = 0x00000002,
    WGPUBlendFactor_Src = 0x00000003,
    WGPUBlendFactor_OneMinusSrc = 0x00000004,
    WGPUBlendFactor_SrcAlpha = 0x00000005,
    WGPUBlendFactor_OneMinusSrcAlpha = 0x00000006,
    WGPUBlendFactor_Dst = 0x00000007,
    WGPUBlendFactor_OneMinusDst = 0x00000008,
    WGPUBlendFactor_DstAlpha = 0x00000009,
    WGPUBlendFactor_OneMinusDstAlpha = 0x0000000A,
    WGPUBlendFactor_SrcAlphaSaturated = 0x0000000B,
    WGPUBlendFactor_Constant = 0x0000000C,
    WGPUBlendFactor_OneMinusConstant = 0x0000000D,
    WGPUBlendFactor_Src1 = 0x0000000E,
    WGPUBlendFactor_OneMinusSrc1 = 0x0000000F,
    WGPUBlendFactor_Src1Alpha = 0x00000010,
    WGPUBlendFactor_OneMinusSrc1Alpha = 0x00000011,
    WGPUBlendFactor_Force32 = 0x7FFFFFFF
} WGPUBlendFactor ;
typedef enum WGPUBlendOperation {
    WGPUBlendOperation_Undefined = 0x00000000,
    WGPUBlendOperation_Add = 0x00000001,
    WGPUBlendOperation_Subtract = 0x00000002,
    WGPUBlendOperation_ReverseSubtract = 0x00000003,
    WGPUBlendOperation_Min = 0x00000004,
    WGPUBlendOperation_Max = 0x00000005,
    WGPUBlendOperation_Force32 = 0x7FFFFFFF
} WGPUBlendOperation ;
typedef enum WGPUBufferBindingType {
    WGPUBufferBindingType_BindingNotUsed = 0x00000000,
    WGPUBufferBindingType_Undefined = 0x00000001,
    WGPUBufferBindingType_Uniform = 0x00000002,
    WGPUBufferBindingType_Storage = 0x00000003,
    WGPUBufferBindingType_ReadOnlyStorage = 0x00000004,
    WGPUBufferBindingType_Force32 = 0x7FFFFFFF
} WGPUBufferBindingType ;
typedef enum WGPUBufferMapState {
    WGPUBufferMapState_Unmapped = 0x00000001,
    WGPUBufferMapState_Pending = 0x00000002,
    WGPUBufferMapState_Mapped = 0x00000003,
    WGPUBufferMapState_Force32 = 0x7FFFFFFF
} WGPUBufferMapState ;
typedef enum WGPUCallbackMode {
    WGPUCallbackMode_WaitAnyOnly = 0x00000001,
    WGPUCallbackMode_AllowProcessEvents = 0x00000002,
    WGPUCallbackMode_AllowSpontaneous = 0x00000003,
    WGPUCallbackMode_Force32 = 0x7FFFFFFF
} WGPUCallbackMode ;
typedef enum WGPUCompareFunction {
    WGPUCompareFunction_Undefined = 0x00000000,
    WGPUCompareFunction_Never = 0x00000001,
    WGPUCompareFunction_Less = 0x00000002,
    WGPUCompareFunction_Equal = 0x00000003,
    WGPUCompareFunction_LessEqual = 0x00000004,
    WGPUCompareFunction_Greater = 0x00000005,
    WGPUCompareFunction_NotEqual = 0x00000006,
    WGPUCompareFunction_GreaterEqual = 0x00000007,
    WGPUCompareFunction_Always = 0x00000008,
    WGPUCompareFunction_Force32 = 0x7FFFFFFF
} WGPUCompareFunction ;
typedef enum WGPUCompilationInfoRequestStatus {
    WGPUCompilationInfoRequestStatus_Success = 0x00000001,
    WGPUCompilationInfoRequestStatus_CallbackCancelled = 0x00000002,
    WGPUCompilationInfoRequestStatus_Force32 = 0x7FFFFFFF
} WGPUCompilationInfoRequestStatus ;
typedef enum WGPUCompilationMessageType {
    WGPUCompilationMessageType_Error = 0x00000001,
    WGPUCompilationMessageType_Warning = 0x00000002,
    WGPUCompilationMessageType_Info = 0x00000003,
    WGPUCompilationMessageType_Force32 = 0x7FFFFFFF
} WGPUCompilationMessageType ;
typedef enum WGPUComponentSwizzle {
    WGPUComponentSwizzle_Undefined = 0x00000000,
    WGPUComponentSwizzle_Zero = 0x00000001,
    WGPUComponentSwizzle_One = 0x00000002,
    WGPUComponentSwizzle_R = 0x00000003,
    WGPUComponentSwizzle_G = 0x00000004,
    WGPUComponentSwizzle_B = 0x00000005,
    WGPUComponentSwizzle_A = 0x00000006,
    WGPUComponentSwizzle_Force32 = 0x7FFFFFFF
} WGPUComponentSwizzle ;
typedef enum WGPUCompositeAlphaMode {
    WGPUCompositeAlphaMode_Auto = 0x00000000,
    WGPUCompositeAlphaMode_Opaque = 0x00000001,
    WGPUCompositeAlphaMode_Premultiplied = 0x00000002,
    WGPUCompositeAlphaMode_Unpremultiplied = 0x00000003,
    WGPUCompositeAlphaMode_Inherit = 0x00000004,
    WGPUCompositeAlphaMode_Force32 = 0x7FFFFFFF
} WGPUCompositeAlphaMode ;
typedef enum WGPUCreatePipelineAsyncStatus {
    WGPUCreatePipelineAsyncStatus_Success = 0x00000001,
    WGPUCreatePipelineAsyncStatus_CallbackCancelled = 0x00000002,
    WGPUCreatePipelineAsyncStatus_ValidationError = 0x00000003,
    WGPUCreatePipelineAsyncStatus_InternalError = 0x00000004,
    WGPUCreatePipelineAsyncStatus_Force32 = 0x7FFFFFFF
} WGPUCreatePipelineAsyncStatus ;
typedef enum WGPUCullMode {
    WGPUCullMode_Undefined = 0x00000000,
    WGPUCullMode_None = 0x00000001,
    WGPUCullMode_Front = 0x00000002,
    WGPUCullMode_Back = 0x00000003,
    WGPUCullMode_Force32 = 0x7FFFFFFF
} WGPUCullMode ;
typedef enum WGPUDeviceLostReason {
    WGPUDeviceLostReason_Unknown = 0x00000001,
    WGPUDeviceLostReason_Destroyed = 0x00000002,
    WGPUDeviceLostReason_CallbackCancelled = 0x00000003,
    WGPUDeviceLostReason_FailedCreation = 0x00000004,
    WGPUDeviceLostReason_Force32 = 0x7FFFFFFF
} WGPUDeviceLostReason ;
typedef enum WGPUErrorFilter {
    WGPUErrorFilter_Validation = 0x00000001,
    WGPUErrorFilter_OutOfMemory = 0x00000002,
    WGPUErrorFilter_Internal = 0x00000003,
    WGPUErrorFilter_Force32 = 0x7FFFFFFF
} WGPUErrorFilter ;
typedef enum WGPUErrorType {
    WGPUErrorType_NoError = 0x00000001,
    WGPUErrorType_Validation = 0x00000002,
    WGPUErrorType_OutOfMemory = 0x00000003,
    WGPUErrorType_Internal = 0x00000004,
    WGPUErrorType_Unknown = 0x00000005,
    WGPUErrorType_Force32 = 0x7FFFFFFF
} WGPUErrorType ;
typedef enum WGPUExternalTextureRotation {
    WGPUExternalTextureRotation_Rotate0Degrees = 0x00000001,
    WGPUExternalTextureRotation_Rotate90Degrees = 0x00000002,
    WGPUExternalTextureRotation_Rotate180Degrees = 0x00000003,
    WGPUExternalTextureRotation_Rotate270Degrees = 0x00000004,
    WGPUExternalTextureRotation_Force32 = 0x7FFFFFFF
} WGPUExternalTextureRotation ;
typedef enum WGPUFeatureLevel {
    WGPUFeatureLevel_Undefined = 0x00000000,
    WGPUFeatureLevel_Compatibility = 0x00000001,
    WGPUFeatureLevel_Core = 0x00000002,
    WGPUFeatureLevel_Force32 = 0x7FFFFFFF
} WGPUFeatureLevel ;
typedef enum WGPUFeatureName {
    WGPUFeatureName_CoreFeaturesAndLimits = 0x00000001,
    WGPUFeatureName_DepthClipControl = 0x00000002,
    WGPUFeatureName_Depth32FloatStencil8 = 0x00000003,
    WGPUFeatureName_TextureCompressionBC = 0x00000004,
    WGPUFeatureName_TextureCompressionBCSliced3D = 0x00000005,
    WGPUFeatureName_TextureCompressionETC2 = 0x00000006,
    WGPUFeatureName_TextureCompressionASTC = 0x00000007,
    WGPUFeatureName_TextureCompressionASTCSliced3D = 0x00000008,
    WGPUFeatureName_TimestampQuery = 0x00000009,
    WGPUFeatureName_IndirectFirstInstance = 0x0000000A,
    WGPUFeatureName_ShaderF16 = 0x0000000B,
    WGPUFeatureName_RG11B10UfloatRenderable = 0x0000000C,
    WGPUFeatureName_BGRA8UnormStorage = 0x0000000D,
    WGPUFeatureName_Float32Filterable = 0x0000000E,
    WGPUFeatureName_Float32Blendable = 0x0000000F,
    WGPUFeatureName_ClipDistances = 0x00000010,
    WGPUFeatureName_DualSourceBlending = 0x00000011,
    WGPUFeatureName_Subgroups = 0x00000012,
    WGPUFeatureName_TextureFormatsTier1 = 0x00000013,
    WGPUFeatureName_TextureFormatsTier2 = 0x00000014,
    WGPUFeatureName_PrimitiveIndex = 0x00000015,
    WGPUFeatureName_TextureComponentSwizzle = 0x00000016,
    WGPUFeatureName_DawnInternalUsages = 0x00050000,
    WGPUFeatureName_DawnMultiPlanarFormats = 0x00050001,
    WGPUFeatureName_DawnNative = 0x00050002,
    WGPUFeatureName_ChromiumExperimentalTimestampQueryInsidePasses = 0x00050003,
    WGPUFeatureName_ImplicitDeviceSynchronization = 0x00050004,
    WGPUFeatureName_TransientAttachments = 0x00050006,
    WGPUFeatureName_MSAARenderToSingleSampled = 0x00050007,
    WGPUFeatureName_D3D11MultithreadProtected = 0x00050008,
    WGPUFeatureName_ANGLETextureSharing = 0x00050009,
    WGPUFeatureName_PixelLocalStorageCoherent = 0x0005000A,
    WGPUFeatureName_PixelLocalStorageNonCoherent = 0x0005000B,
    WGPUFeatureName_Unorm16TextureFormats = 0x0005000C,
    WGPUFeatureName_MultiPlanarFormatExtendedUsages = 0x0005000D,
    WGPUFeatureName_MultiPlanarFormatP010 = 0x0005000E,
    WGPUFeatureName_HostMappedPointer = 0x0005000F,
    WGPUFeatureName_MultiPlanarRenderTargets = 0x00050010,
    WGPUFeatureName_MultiPlanarFormatNv12a = 0x00050011,
    WGPUFeatureName_FramebufferFetch = 0x00050012,
    WGPUFeatureName_BufferMapExtendedUsages = 0x00050013,
    WGPUFeatureName_AdapterPropertiesMemoryHeaps = 0x00050014,
    WGPUFeatureName_AdapterPropertiesD3D = 0x00050015,
    WGPUFeatureName_AdapterPropertiesVk = 0x00050016,
    WGPUFeatureName_DawnFormatCapabilities = 0x00050017,
    WGPUFeatureName_DawnDrmFormatCapabilities = 0x00050018,
    WGPUFeatureName_MultiPlanarFormatNv16 = 0x00050019,
    WGPUFeatureName_MultiPlanarFormatNv24 = 0x0005001A,
    WGPUFeatureName_MultiPlanarFormatP210 = 0x0005001B,
    WGPUFeatureName_MultiPlanarFormatP410 = 0x0005001C,
    WGPUFeatureName_SharedTextureMemoryVkDedicatedAllocation = 0x0005001D,
    WGPUFeatureName_SharedTextureMemoryAHardwareBuffer = 0x0005001E,
    WGPUFeatureName_SharedTextureMemoryDmaBuf = 0x0005001F,
    WGPUFeatureName_SharedTextureMemoryOpaqueFD = 0x00050020,
    WGPUFeatureName_SharedTextureMemoryZirconHandle = 0x00050021,
    WGPUFeatureName_SharedTextureMemoryDXGISharedHandle = 0x00050022,
    WGPUFeatureName_SharedTextureMemoryD3D11Texture2D = 0x00050023,
    WGPUFeatureName_SharedTextureMemoryIOSurface = 0x00050024,
    WGPUFeatureName_SharedTextureMemoryEGLImage = 0x00050025,
    WGPUFeatureName_SharedFenceVkSemaphoreOpaqueFD = 0x00050026,
    WGPUFeatureName_SharedFenceSyncFD = 0x00050027,
    WGPUFeatureName_SharedFenceVkSemaphoreZirconHandle = 0x00050028,
    WGPUFeatureName_SharedFenceDXGISharedHandle = 0x00050029,
    WGPUFeatureName_SharedFenceMTLSharedEvent = 0x0005002A,
    WGPUFeatureName_SharedBufferMemoryD3D12Resource = 0x0005002B,
    WGPUFeatureName_StaticSamplers = 0x0005002C,
    WGPUFeatureName_YCbCrVulkanSamplers = 0x0005002D,
    WGPUFeatureName_ShaderModuleCompilationOptions = 0x0005002E,
    WGPUFeatureName_DawnLoadResolveTexture = 0x0005002F,
    WGPUFeatureName_DawnPartialLoadResolveTexture = 0x00050030,
    WGPUFeatureName_MultiDrawIndirect = 0x00050031,
    WGPUFeatureName_DawnTexelCopyBufferRowAlignment = 0x00050032,
    WGPUFeatureName_FlexibleTextureViews = 0x00050033,
    WGPUFeatureName_ChromiumExperimentalSubgroupMatrix = 0x00050034,
    WGPUFeatureName_SharedFenceEGLSync = 0x00050035,
    WGPUFeatureName_DawnDeviceAllocatorControl = 0x00050036,
    WGPUFeatureName_AdapterPropertiesWGPU = 0x00050037,
    WGPUFeatureName_SharedBufferMemoryD3D12SharedMemoryFileMappingHandle = 0x00050038,
    WGPUFeatureName_SharedTextureMemoryD3D12Resource = 0x00050039,
    WGPUFeatureName_ChromiumExperimentalSamplingResourceTable = 0x0005003A,
    WGPUFeatureName_Force32 = 0x7FFFFFFF
} WGPUFeatureName ;
typedef enum WGPUFilterMode {
    WGPUFilterMode_Undefined = 0x00000000,
    WGPUFilterMode_Nearest = 0x00000001,
    WGPUFilterMode_Linear = 0x00000002,
    WGPUFilterMode_Force32 = 0x7FFFFFFF
} WGPUFilterMode ;
typedef enum WGPUFrontFace {
    WGPUFrontFace_Undefined = 0x00000000,
    WGPUFrontFace_CCW = 0x00000001,
    WGPUFrontFace_CW = 0x00000002,
    WGPUFrontFace_Force32 = 0x7FFFFFFF
} WGPUFrontFace ;
typedef enum WGPUIndexFormat {
    WGPUIndexFormat_Undefined = 0x00000000,
    WGPUIndexFormat_Uint16 = 0x00000001,
    WGPUIndexFormat_Uint32 = 0x00000002,
    WGPUIndexFormat_Force32 = 0x7FFFFFFF
} WGPUIndexFormat ;
typedef enum WGPUInstanceFeatureName {
    WGPUInstanceFeatureName_TimedWaitAny = 0x00000001,
    WGPUInstanceFeatureName_ShaderSourceSPIRV = 0x00000002,
    WGPUInstanceFeatureName_MultipleDevicesPerAdapter = 0x00000003,
    WGPUInstanceFeatureName_Force32 = 0x7FFFFFFF
} WGPUInstanceFeatureName ;
typedef enum WGPULoadOp {
    WGPULoadOp_Undefined = 0x00000000,
    WGPULoadOp_Load = 0x00000001,
    WGPULoadOp_Clear = 0x00000002,
    WGPULoadOp_ExpandResolveTexture = 0x00050003,
    WGPULoadOp_Force32 = 0x7FFFFFFF
} WGPULoadOp ;
typedef enum WGPULoggingType {
    WGPULoggingType_Verbose = 0x00000001,
    WGPULoggingType_Info = 0x00000002,
    WGPULoggingType_Warning = 0x00000003,
    WGPULoggingType_Error = 0x00000004,
    WGPULoggingType_Force32 = 0x7FFFFFFF
} WGPULoggingType ;
typedef enum WGPUMapAsyncStatus {
    WGPUMapAsyncStatus_Success = 0x00000001,
    WGPUMapAsyncStatus_CallbackCancelled = 0x00000002,
    WGPUMapAsyncStatus_Error = 0x00000003,
    WGPUMapAsyncStatus_Aborted = 0x00000004,
    WGPUMapAsyncStatus_Force32 = 0x7FFFFFFF
} WGPUMapAsyncStatus ;
typedef enum WGPUMipmapFilterMode {
    WGPUMipmapFilterMode_Undefined = 0x00000000,
    WGPUMipmapFilterMode_Nearest = 0x00000001,
    WGPUMipmapFilterMode_Linear = 0x00000002,
    WGPUMipmapFilterMode_Force32 = 0x7FFFFFFF
} WGPUMipmapFilterMode ;
typedef enum WGPUOptionalBool {
    WGPUOptionalBool_False = 0x00000000,
    WGPUOptionalBool_True = 0x00000001,
    WGPUOptionalBool_Undefined = 0x00000002,
    WGPUOptionalBool_Force32 = 0x7FFFFFFF
} WGPUOptionalBool ;
typedef enum WGPUPopErrorScopeStatus {
    WGPUPopErrorScopeStatus_Success = 0x00000001,
    WGPUPopErrorScopeStatus_CallbackCancelled = 0x00000002,
    WGPUPopErrorScopeStatus_Error = 0x00000003,
    WGPUPopErrorScopeStatus_Force32 = 0x7FFFFFFF
} WGPUPopErrorScopeStatus ;
typedef enum WGPUPowerPreference {
    WGPUPowerPreference_Undefined = 0x00000000,
    WGPUPowerPreference_LowPower = 0x00000001,
    WGPUPowerPreference_HighPerformance = 0x00000002,
    WGPUPowerPreference_Force32 = 0x7FFFFFFF
} WGPUPowerPreference ;
typedef enum WGPUPredefinedColorSpace {
    WGPUPredefinedColorSpace_SRGB = 0x00000001,
    WGPUPredefinedColorSpace_DisplayP3 = 0x00000002,
    WGPUPredefinedColorSpace_Force32 = 0x7FFFFFFF
} WGPUPredefinedColorSpace ;
typedef enum WGPUPresentMode {
    WGPUPresentMode_Undefined = 0x00000000,
    WGPUPresentMode_Fifo = 0x00000001,
    WGPUPresentMode_FifoRelaxed = 0x00000002,
    WGPUPresentMode_Immediate = 0x00000003,
    WGPUPresentMode_Mailbox = 0x00000004,
    WGPUPresentMode_Force32 = 0x7FFFFFFF
} WGPUPresentMode ;
typedef enum WGPUPrimitiveTopology {
    WGPUPrimitiveTopology_Undefined = 0x00000000,
    WGPUPrimitiveTopology_PointList = 0x00000001,
    WGPUPrimitiveTopology_LineList = 0x00000002,
    WGPUPrimitiveTopology_LineStrip = 0x00000003,
    WGPUPrimitiveTopology_TriangleList = 0x00000004,
    WGPUPrimitiveTopology_TriangleStrip = 0x00000005,
    WGPUPrimitiveTopology_Force32 = 0x7FFFFFFF
} WGPUPrimitiveTopology ;
typedef enum WGPUQueryType {
    WGPUQueryType_Occlusion = 0x00000001,
    WGPUQueryType_Timestamp = 0x00000002,
    WGPUQueryType_Force32 = 0x7FFFFFFF
} WGPUQueryType ;
typedef enum WGPUQueueWorkDoneStatus {
    WGPUQueueWorkDoneStatus_Success = 0x00000001,
    WGPUQueueWorkDoneStatus_CallbackCancelled = 0x00000002,
    WGPUQueueWorkDoneStatus_Error = 0x00000003,
    WGPUQueueWorkDoneStatus_Force32 = 0x7FFFFFFF
} WGPUQueueWorkDoneStatus ;
typedef enum WGPURequestAdapterStatus {
    WGPURequestAdapterStatus_Success = 0x00000001,
    WGPURequestAdapterStatus_CallbackCancelled = 0x00000002,
    WGPURequestAdapterStatus_Unavailable = 0x00000003,
    WGPURequestAdapterStatus_Error = 0x00000004,
    WGPURequestAdapterStatus_Force32 = 0x7FFFFFFF
} WGPURequestAdapterStatus ;
typedef enum WGPURequestDeviceStatus {
    WGPURequestDeviceStatus_Success = 0x00000001,
    WGPURequestDeviceStatus_CallbackCancelled = 0x00000002,
    WGPURequestDeviceStatus_Error = 0x00000003,
    WGPURequestDeviceStatus_Force32 = 0x7FFFFFFF
} WGPURequestDeviceStatus ;
typedef enum WGPUSamplerBindingType {
    WGPUSamplerBindingType_BindingNotUsed = 0x00000000,
    WGPUSamplerBindingType_Undefined = 0x00000001,
    WGPUSamplerBindingType_Filtering = 0x00000002,
    WGPUSamplerBindingType_NonFiltering = 0x00000003,
    WGPUSamplerBindingType_Comparison = 0x00000004,
    WGPUSamplerBindingType_Force32 = 0x7FFFFFFF
} WGPUSamplerBindingType ;
typedef enum WGPUSharedFenceType {
    WGPUSharedFenceType_VkSemaphoreOpaqueFD = 0x00000001,
    WGPUSharedFenceType_SyncFD = 0x00000002,
    WGPUSharedFenceType_VkSemaphoreZirconHandle = 0x00000003,
    WGPUSharedFenceType_DXGISharedHandle = 0x00000004,
    WGPUSharedFenceType_MTLSharedEvent = 0x00000005,
    WGPUSharedFenceType_EGLSync = 0x00000006,
    WGPUSharedFenceType_Force32 = 0x7FFFFFFF
} WGPUSharedFenceType ;
typedef enum WGPUStatus {
    WGPUStatus_Success = 0x00000001,
    WGPUStatus_Error = 0x00000002,
    WGPUStatus_Force32 = 0x7FFFFFFF
} WGPUStatus ;
typedef enum WGPUStencilOperation {
    WGPUStencilOperation_Undefined = 0x00000000,
    WGPUStencilOperation_Keep = 0x00000001,
    WGPUStencilOperation_Zero = 0x00000002,
    WGPUStencilOperation_Replace = 0x00000003,
    WGPUStencilOperation_Invert = 0x00000004,
    WGPUStencilOperation_IncrementClamp = 0x00000005,
    WGPUStencilOperation_DecrementClamp = 0x00000006,
    WGPUStencilOperation_IncrementWrap = 0x00000007,
    WGPUStencilOperation_DecrementWrap = 0x00000008,
    WGPUStencilOperation_Force32 = 0x7FFFFFFF
} WGPUStencilOperation ;
typedef enum WGPUStorageTextureAccess {
    WGPUStorageTextureAccess_BindingNotUsed = 0x00000000,
    WGPUStorageTextureAccess_Undefined = 0x00000001,
    WGPUStorageTextureAccess_WriteOnly = 0x00000002,
    WGPUStorageTextureAccess_ReadOnly = 0x00000003,
    WGPUStorageTextureAccess_ReadWrite = 0x00000004,
    WGPUStorageTextureAccess_Force32 = 0x7FFFFFFF
} WGPUStorageTextureAccess ;
typedef enum WGPUStoreOp {
    WGPUStoreOp_Undefined = 0x00000000,
    WGPUStoreOp_Store = 0x00000001,
    WGPUStoreOp_Discard = 0x00000002,
    WGPUStoreOp_Force32 = 0x7FFFFFFF
} WGPUStoreOp ;
typedef enum WGPUSType {
    WGPUSType_ShaderSourceSPIRV = 0x00000001,
    WGPUSType_ShaderSourceWGSL = 0x00000002,
    WGPUSType_RenderPassMaxDrawCount = 0x00000003,
    WGPUSType_SurfaceSourceMetalLayer = 0x00000004,
    WGPUSType_SurfaceSourceWindowsHWND = 0x00000005,
    WGPUSType_SurfaceSourceXlibWindow = 0x00000006,
    WGPUSType_SurfaceSourceWaylandSurface = 0x00000007,
    WGPUSType_SurfaceSourceAndroidNativeWindow = 0x00000008,
    WGPUSType_SurfaceSourceXCBWindow = 0x00000009,
    WGPUSType_SurfaceColorManagement = 0x0000000A,
    WGPUSType_RequestAdapterWebXROptions = 0x0000000B,
    WGPUSType_TextureComponentSwizzleDescriptor = 0x0000000C,
    WGPUSType_CompatibilityModeLimits = 0x00020000,
    WGPUSType_TextureBindingViewDimensionDescriptor = 0x00020001,
    WGPUSType_EmscriptenSurfaceSourceCanvasHTMLSelector = 0x00040000,
    WGPUSType_SurfaceDescriptorFromWindowsCoreWindow = 0x00050000,
    WGPUSType_ExternalTextureBindingEntry = 0x00050001,
    WGPUSType_ExternalTextureBindingLayout = 0x00050002,
    WGPUSType_SurfaceDescriptorFromWindowsUWPSwapChainPanel = 0x00050003,
    WGPUSType_DawnTextureInternalUsageDescriptor = 0x00050004,
    WGPUSType_DawnEncoderInternalUsageDescriptor = 0x00050005,
    WGPUSType_DawnInstanceDescriptor = 0x00050006,
    WGPUSType_DawnCacheDeviceDescriptor = 0x00050007,
    WGPUSType_DawnAdapterPropertiesPowerPreference = 0x00050008,
    WGPUSType_DawnBufferDescriptorErrorInfoFromWireClient = 0x00050009,
    WGPUSType_DawnTogglesDescriptor = 0x0005000A,
    WGPUSType_DawnShaderModuleSPIRVOptionsDescriptor = 0x0005000B,
    WGPUSType_RequestAdapterOptionsLUID = 0x0005000C,
    WGPUSType_RequestAdapterOptionsGetGLProc = 0x0005000D,
    WGPUSType_RequestAdapterOptionsD3D11Device = 0x0005000E,
    WGPUSType_DawnRenderPassColorAttachmentRenderToSingleSampled = 0x0005000F,
    WGPUSType_RenderPassPixelLocalStorage = 0x00050010,
    WGPUSType_PipelineLayoutPixelLocalStorage = 0x00050011,
    WGPUSType_BufferHostMappedPointer = 0x00050012,
    WGPUSType_AdapterPropertiesMemoryHeaps = 0x00050013,
    WGPUSType_AdapterPropertiesD3D = 0x00050014,
    WGPUSType_AdapterPropertiesVk = 0x00050015,
    WGPUSType_DawnWireWGSLControl = 0x00050016,
    WGPUSType_DawnWGSLBlocklist = 0x00050017,
    WGPUSType_DawnDrmFormatCapabilities = 0x00050018,
    WGPUSType_ShaderModuleCompilationOptions = 0x00050019,
    WGPUSType_ColorTargetStateExpandResolveTextureDawn = 0x0005001A,
    WGPUSType_RenderPassDescriptorExpandResolveRect = 0x0005001B,
    WGPUSType_SharedTextureMemoryVkDedicatedAllocationDescriptor = 0x0005001C,
    WGPUSType_SharedTextureMemoryAHardwareBufferDescriptor = 0x0005001D,
    WGPUSType_SharedTextureMemoryDmaBufDescriptor = 0x0005001E,
    WGPUSType_SharedTextureMemoryOpaqueFDDescriptor = 0x0005001F,
    WGPUSType_SharedTextureMemoryZirconHandleDescriptor = 0x00050020,
    WGPUSType_SharedTextureMemoryDXGISharedHandleDescriptor = 0x00050021,
    WGPUSType_SharedTextureMemoryD3D11Texture2DDescriptor = 0x00050022,
    WGPUSType_SharedTextureMemoryIOSurfaceDescriptor = 0x00050023,
    WGPUSType_SharedTextureMemoryEGLImageDescriptor = 0x00050024,
    WGPUSType_SharedTextureMemoryInitializedBeginState = 0x00050025,
    WGPUSType_SharedTextureMemoryInitializedEndState = 0x00050026,
    WGPUSType_SharedTextureMemoryVkImageLayoutBeginState = 0x00050027,
    WGPUSType_SharedTextureMemoryVkImageLayoutEndState = 0x00050028,
    WGPUSType_SharedTextureMemoryD3DSwapchainBeginState = 0x00050029,
    WGPUSType_SharedFenceVkSemaphoreOpaqueFDDescriptor = 0x0005002A,
    WGPUSType_SharedFenceVkSemaphoreOpaqueFDExportInfo = 0x0005002B,
    WGPUSType_SharedFenceSyncFDDescriptor = 0x0005002C,
    WGPUSType_SharedFenceSyncFDExportInfo = 0x0005002D,
    WGPUSType_SharedFenceVkSemaphoreZirconHandleDescriptor = 0x0005002E,
    WGPUSType_SharedFenceVkSemaphoreZirconHandleExportInfo = 0x0005002F,
    WGPUSType_SharedFenceDXGISharedHandleDescriptor = 0x00050030,
    WGPUSType_SharedFenceDXGISharedHandleExportInfo = 0x00050031,
    WGPUSType_SharedFenceMTLSharedEventDescriptor = 0x00050032,
    WGPUSType_SharedFenceMTLSharedEventExportInfo = 0x00050033,
    WGPUSType_SharedBufferMemoryD3D12ResourceDescriptor = 0x00050034,
    WGPUSType_StaticSamplerBindingLayout = 0x00050035,
    WGPUSType_YCbCrVkDescriptor = 0x00050036,
    WGPUSType_SharedTextureMemoryAHardwareBufferProperties = 0x00050037,
    WGPUSType_AHardwareBufferProperties = 0x00050038,
    WGPUSType_DawnTexelCopyBufferRowAlignmentLimits = 0x0005003A,
    WGPUSType_AdapterPropertiesSubgroupMatrixConfigs = 0x0005003B,
    WGPUSType_SharedFenceEGLSyncDescriptor = 0x0005003C,
    WGPUSType_SharedFenceEGLSyncExportInfo = 0x0005003D,
    WGPUSType_DawnInjectedInvalidSType = 0x0005003E,
    WGPUSType_DawnCompilationMessageUtf16 = 0x0005003F,
    WGPUSType_DawnFakeBufferOOMForTesting = 0x00050040,
    WGPUSType_SurfaceDescriptorFromWindowsWinUISwapChainPanel = 0x00050041,
    WGPUSType_DawnDeviceAllocatorControl = 0x00050042,
    WGPUSType_DawnHostMappedPointerLimits = 0x00050043,
    WGPUSType_RenderPassDescriptorResolveRect = 0x00050044,
    WGPUSType_RequestAdapterWebGPUBackendOptions = 0x00050045,
    WGPUSType_DawnFakeDeviceInitializeErrorForTesting = 0x00050046,
    WGPUSType_SharedTextureMemoryD3D11BeginState = 0x00050047,
    WGPUSType_DawnConsumeAdapterDescriptor = 0x00050048,
    WGPUSType_TexelBufferBindingEntry = 0x00050049,
    WGPUSType_TexelBufferBindingLayout = 0x0005004A,
    WGPUSType_SharedTextureMemoryMetalEndAccessState = 0x0005004B,
    WGPUSType_AdapterPropertiesWGPU = 0x0005004C,
    WGPUSType_SharedBufferMemoryD3D12SharedMemoryFileMappingHandleDescriptor = 0x0005004D,
    WGPUSType_SharedTextureMemoryD3D12ResourceDescriptor = 0x0005004E,
    WGPUSType_RequestAdapterOptionsAngleVirtualizationGroup = 0x0005004F,
    WGPUSType_ResourceTableLimits = 0x00050050,
    WGPUSType_PipelineLayoutResourceTable = 0x00050051,
    WGPUSType_Force32 = 0x7FFFFFFF
} WGPUSType ;
typedef enum WGPUSubgroupMatrixComponentType {
    WGPUSubgroupMatrixComponentType_F32 = 0x00000001,
    WGPUSubgroupMatrixComponentType_F16 = 0x00000002,
    WGPUSubgroupMatrixComponentType_U32 = 0x00000003,
    WGPUSubgroupMatrixComponentType_I32 = 0x00000004,
    WGPUSubgroupMatrixComponentType_U8 = 0x00000005,
    WGPUSubgroupMatrixComponentType_I8 = 0x00000006,
    WGPUSubgroupMatrixComponentType_Force32 = 0x7FFFFFFF
} WGPUSubgroupMatrixComponentType ;
typedef enum WGPUSurfaceGetCurrentTextureStatus {
    WGPUSurfaceGetCurrentTextureStatus_SuccessOptimal = 0x00000001,
    WGPUSurfaceGetCurrentTextureStatus_SuccessSuboptimal = 0x00000002,
    WGPUSurfaceGetCurrentTextureStatus_Timeout = 0x00000003,
    WGPUSurfaceGetCurrentTextureStatus_Outdated = 0x00000004,
    WGPUSurfaceGetCurrentTextureStatus_Lost = 0x00000005,
    WGPUSurfaceGetCurrentTextureStatus_Error = 0x00000006,
    WGPUSurfaceGetCurrentTextureStatus_Force32 = 0x7FFFFFFF
} WGPUSurfaceGetCurrentTextureStatus ;
typedef enum WGPUTexelBufferAccess {
    WGPUTexelBufferAccess_Undefined = 0x00000000,
    WGPUTexelBufferAccess_ReadOnly = 0x00000001,
    WGPUTexelBufferAccess_ReadWrite = 0x00000002,
    WGPUTexelBufferAccess_Force32 = 0x7FFFFFFF
} WGPUTexelBufferAccess ;
typedef enum WGPUTextureAspect {
    WGPUTextureAspect_Undefined = 0x00000000,
    WGPUTextureAspect_All = 0x00000001,
    WGPUTextureAspect_StencilOnly = 0x00000002,
    WGPUTextureAspect_DepthOnly = 0x00000003,
    WGPUTextureAspect_Plane0Only = 0x00050000,
    WGPUTextureAspect_Plane1Only = 0x00050001,
    WGPUTextureAspect_Plane2Only = 0x00050002,
    WGPUTextureAspect_Force32 = 0x7FFFFFFF
} WGPUTextureAspect ;
typedef enum WGPUTextureDimension {
    WGPUTextureDimension_Undefined = 0x00000000,
    WGPUTextureDimension_1D = 0x00000001,
    WGPUTextureDimension_2D = 0x00000002,
    WGPUTextureDimension_3D = 0x00000003,
    WGPUTextureDimension_Force32 = 0x7FFFFFFF
} WGPUTextureDimension ;
typedef enum WGPUTextureFormat {
    WGPUTextureFormat_Undefined = 0x00000000,
    WGPUTextureFormat_R8Unorm = 0x00000001,
    WGPUTextureFormat_R8Snorm = 0x00000002,
    WGPUTextureFormat_R8Uint = 0x00000003,
    WGPUTextureFormat_R8Sint = 0x00000004,
    WGPUTextureFormat_R16Unorm = 0x00000005,
    WGPUTextureFormat_R16Snorm = 0x00000006,
    WGPUTextureFormat_R16Uint = 0x00000007,
    WGPUTextureFormat_R16Sint = 0x00000008,
    WGPUTextureFormat_R16Float = 0x00000009,
    WGPUTextureFormat_RG8Unorm = 0x0000000A,
    WGPUTextureFormat_RG8Snorm = 0x0000000B,
    WGPUTextureFormat_RG8Uint = 0x0000000C,
    WGPUTextureFormat_RG8Sint = 0x0000000D,
    WGPUTextureFormat_R32Float = 0x0000000E,
    WGPUTextureFormat_R32Uint = 0x0000000F,
    WGPUTextureFormat_R32Sint = 0x00000010,
    WGPUTextureFormat_RG16Unorm = 0x00000011,
    WGPUTextureFormat_RG16Snorm = 0x00000012,
    WGPUTextureFormat_RG16Uint = 0x00000013,
    WGPUTextureFormat_RG16Sint = 0x00000014,
    WGPUTextureFormat_RG16Float = 0x00000015,
    WGPUTextureFormat_RGBA8Unorm = 0x00000016,
    WGPUTextureFormat_RGBA8UnormSrgb = 0x00000017,
    WGPUTextureFormat_RGBA8Snorm = 0x00000018,
    WGPUTextureFormat_RGBA8Uint = 0x00000019,
    WGPUTextureFormat_RGBA8Sint = 0x0000001A,
    WGPUTextureFormat_BGRA8Unorm = 0x0000001B,
    WGPUTextureFormat_BGRA8UnormSrgb = 0x0000001C,
    WGPUTextureFormat_RGB10A2Uint = 0x0000001D,
    WGPUTextureFormat_RGB10A2Unorm = 0x0000001E,
    WGPUTextureFormat_RG11B10Ufloat = 0x0000001F,
    WGPUTextureFormat_RGB9E5Ufloat = 0x00000020,
    WGPUTextureFormat_RG32Float = 0x00000021,
    WGPUTextureFormat_RG32Uint = 0x00000022,
    WGPUTextureFormat_RG32Sint = 0x00000023,
    WGPUTextureFormat_RGBA16Unorm = 0x00000024,
    WGPUTextureFormat_RGBA16Snorm = 0x00000025,
    WGPUTextureFormat_RGBA16Uint = 0x00000026,
    WGPUTextureFormat_RGBA16Sint = 0x00000027,
    WGPUTextureFormat_RGBA16Float = 0x00000028,
    WGPUTextureFormat_RGBA32Float = 0x00000029,
    WGPUTextureFormat_RGBA32Uint = 0x0000002A,
    WGPUTextureFormat_RGBA32Sint = 0x0000002B,
    WGPUTextureFormat_Stencil8 = 0x0000002C,
    WGPUTextureFormat_Depth16Unorm = 0x0000002D,
    WGPUTextureFormat_Depth24Plus = 0x0000002E,
    WGPUTextureFormat_Depth24PlusStencil8 = 0x0000002F,
    WGPUTextureFormat_Depth32Float = 0x00000030,
    WGPUTextureFormat_Depth32FloatStencil8 = 0x00000031,
    WGPUTextureFormat_BC1RGBAUnorm = 0x00000032,
    WGPUTextureFormat_BC1RGBAUnormSrgb = 0x00000033,
    WGPUTextureFormat_BC2RGBAUnorm = 0x00000034,
    WGPUTextureFormat_BC2RGBAUnormSrgb = 0x00000035,
    WGPUTextureFormat_BC3RGBAUnorm = 0x00000036,
    WGPUTextureFormat_BC3RGBAUnormSrgb = 0x00000037,
    WGPUTextureFormat_BC4RUnorm = 0x00000038,
    WGPUTextureFormat_BC4RSnorm = 0x00000039,
    WGPUTextureFormat_BC5RGUnorm = 0x0000003A,
    WGPUTextureFormat_BC5RGSnorm = 0x0000003B,
    WGPUTextureFormat_BC6HRGBUfloat = 0x0000003C,
    WGPUTextureFormat_BC6HRGBFloat = 0x0000003D,
    WGPUTextureFormat_BC7RGBAUnorm = 0x0000003E,
    WGPUTextureFormat_BC7RGBAUnormSrgb = 0x0000003F,
    WGPUTextureFormat_ETC2RGB8Unorm = 0x00000040,
    WGPUTextureFormat_ETC2RGB8UnormSrgb = 0x00000041,
    WGPUTextureFormat_ETC2RGB8A1Unorm = 0x00000042,
    WGPUTextureFormat_ETC2RGB8A1UnormSrgb = 0x00000043,
    WGPUTextureFormat_ETC2RGBA8Unorm = 0x00000044,
    WGPUTextureFormat_ETC2RGBA8UnormSrgb = 0x00000045,
    WGPUTextureFormat_EACR11Unorm = 0x00000046,
    WGPUTextureFormat_EACR11Snorm = 0x00000047,
    WGPUTextureFormat_EACRG11Unorm = 0x00000048,
    WGPUTextureFormat_EACRG11Snorm = 0x00000049,
    WGPUTextureFormat_ASTC4x4Unorm = 0x0000004A,
    WGPUTextureFormat_ASTC4x4UnormSrgb = 0x0000004B,
    WGPUTextureFormat_ASTC5x4Unorm = 0x0000004C,
    WGPUTextureFormat_ASTC5x4UnormSrgb = 0x0000004D,
    WGPUTextureFormat_ASTC5x5Unorm = 0x0000004E,
    WGPUTextureFormat_ASTC5x5UnormSrgb = 0x0000004F,
    WGPUTextureFormat_ASTC6x5Unorm = 0x00000050,
    WGPUTextureFormat_ASTC6x5UnormSrgb = 0x00000051,
    WGPUTextureFormat_ASTC6x6Unorm = 0x00000052,
    WGPUTextureFormat_ASTC6x6UnormSrgb = 0x00000053,
    WGPUTextureFormat_ASTC8x5Unorm = 0x00000054,
    WGPUTextureFormat_ASTC8x5UnormSrgb = 0x00000055,
    WGPUTextureFormat_ASTC8x6Unorm = 0x00000056,
    WGPUTextureFormat_ASTC8x6UnormSrgb = 0x00000057,
    WGPUTextureFormat_ASTC8x8Unorm = 0x00000058,
    WGPUTextureFormat_ASTC8x8UnormSrgb = 0x00000059,
    WGPUTextureFormat_ASTC10x5Unorm = 0x0000005A,
    WGPUTextureFormat_ASTC10x5UnormSrgb = 0x0000005B,
    WGPUTextureFormat_ASTC10x6Unorm = 0x0000005C,
    WGPUTextureFormat_ASTC10x6UnormSrgb = 0x0000005D,
    WGPUTextureFormat_ASTC10x8Unorm = 0x0000005E,
    WGPUTextureFormat_ASTC10x8UnormSrgb = 0x0000005F,
    WGPUTextureFormat_ASTC10x10Unorm = 0x00000060,
    WGPUTextureFormat_ASTC10x10UnormSrgb = 0x00000061,
    WGPUTextureFormat_ASTC12x10Unorm = 0x00000062,
    WGPUTextureFormat_ASTC12x10UnormSrgb = 0x00000063,
    WGPUTextureFormat_ASTC12x12Unorm = 0x00000064,
    WGPUTextureFormat_ASTC12x12UnormSrgb = 0x00000065,
    WGPUTextureFormat_R8BG8Biplanar420Unorm = 0x00050006,
    WGPUTextureFormat_R10X6BG10X6Biplanar420Unorm = 0x00050007,
    WGPUTextureFormat_R8BG8A8Triplanar420Unorm = 0x00050008,
    WGPUTextureFormat_R8BG8Biplanar422Unorm = 0x00050009,
    WGPUTextureFormat_R8BG8Biplanar444Unorm = 0x0005000A,
    WGPUTextureFormat_R10X6BG10X6Biplanar422Unorm = 0x0005000B,
    WGPUTextureFormat_R10X6BG10X6Biplanar444Unorm = 0x0005000C,
    WGPUTextureFormat_External = 0x0005000D,
    WGPUTextureFormat_Force32 = 0x7FFFFFFF
} WGPUTextureFormat ;
typedef enum WGPUTextureSampleType {
    WGPUTextureSampleType_BindingNotUsed = 0x00000000,
    WGPUTextureSampleType_Undefined = 0x00000001,
    WGPUTextureSampleType_Float = 0x00000002,
    WGPUTextureSampleType_UnfilterableFloat = 0x00000003,
    WGPUTextureSampleType_Depth = 0x00000004,
    WGPUTextureSampleType_Sint = 0x00000005,
    WGPUTextureSampleType_Uint = 0x00000006,
    WGPUTextureSampleType_Force32 = 0x7FFFFFFF
} WGPUTextureSampleType ;
typedef enum WGPUTextureViewDimension {
    WGPUTextureViewDimension_Undefined = 0x00000000,
    WGPUTextureViewDimension_1D = 0x00000001,
    WGPUTextureViewDimension_2D = 0x00000002,
    WGPUTextureViewDimension_2DArray = 0x00000003,
    WGPUTextureViewDimension_Cube = 0x00000004,
    WGPUTextureViewDimension_CubeArray = 0x00000005,
    WGPUTextureViewDimension_3D = 0x00000006,
    WGPUTextureViewDimension_Force32 = 0x7FFFFFFF
} WGPUTextureViewDimension ;
typedef enum WGPUToneMappingMode {
    WGPUToneMappingMode_Standard = 0x00000001,
    WGPUToneMappingMode_Extended = 0x00000002,
    WGPUToneMappingMode_Force32 = 0x7FFFFFFF
} WGPUToneMappingMode ;
typedef enum WGPUVertexFormat {
    WGPUVertexFormat_Uint8 = 0x00000001,
    WGPUVertexFormat_Uint8x2 = 0x00000002,
    WGPUVertexFormat_Uint8x4 = 0x00000003,
    WGPUVertexFormat_Sint8 = 0x00000004,
    WGPUVertexFormat_Sint8x2 = 0x00000005,
    WGPUVertexFormat_Sint8x4 = 0x00000006,
    WGPUVertexFormat_Unorm8 = 0x00000007,
    WGPUVertexFormat_Unorm8x2 = 0x00000008,
    WGPUVertexFormat_Unorm8x4 = 0x00000009,
    WGPUVertexFormat_Snorm8 = 0x0000000A,
    WGPUVertexFormat_Snorm8x2 = 0x0000000B,
    WGPUVertexFormat_Snorm8x4 = 0x0000000C,
    WGPUVertexFormat_Uint16 = 0x0000000D,
    WGPUVertexFormat_Uint16x2 = 0x0000000E,
    WGPUVertexFormat_Uint16x4 = 0x0000000F,
    WGPUVertexFormat_Sint16 = 0x00000010,
    WGPUVertexFormat_Sint16x2 = 0x00000011,
    WGPUVertexFormat_Sint16x4 = 0x00000012,
    WGPUVertexFormat_Unorm16 = 0x00000013,
    WGPUVertexFormat_Unorm16x2 = 0x00000014,
    WGPUVertexFormat_Unorm16x4 = 0x00000015,
    WGPUVertexFormat_Snorm16 = 0x00000016,
    WGPUVertexFormat_Snorm16x2 = 0x00000017,
    WGPUVertexFormat_Snorm16x4 = 0x00000018,
    WGPUVertexFormat_Float16 = 0x00000019,
    WGPUVertexFormat_Float16x2 = 0x0000001A,
    WGPUVertexFormat_Float16x4 = 0x0000001B,
    WGPUVertexFormat_Float32 = 0x0000001C,
    WGPUVertexFormat_Float32x2 = 0x0000001D,
    WGPUVertexFormat_Float32x3 = 0x0000001E,
    WGPUVertexFormat_Float32x4 = 0x0000001F,
    WGPUVertexFormat_Uint32 = 0x00000020,
    WGPUVertexFormat_Uint32x2 = 0x00000021,
    WGPUVertexFormat_Uint32x3 = 0x00000022,
    WGPUVertexFormat_Uint32x4 = 0x00000023,
    WGPUVertexFormat_Sint32 = 0x00000024,
    WGPUVertexFormat_Sint32x2 = 0x00000025,
    WGPUVertexFormat_Sint32x3 = 0x00000026,
    WGPUVertexFormat_Sint32x4 = 0x00000027,
    WGPUVertexFormat_Unorm10_10_10_2 = 0x00000028,
    WGPUVertexFormat_Unorm8x4BGRA = 0x00000029,
    WGPUVertexFormat_Force32 = 0x7FFFFFFF
} WGPUVertexFormat ;
typedef enum WGPUVertexStepMode {
    WGPUVertexStepMode_Undefined = 0x00000000,
    WGPUVertexStepMode_Vertex = 0x00000001,
    WGPUVertexStepMode_Instance = 0x00000002,
    WGPUVertexStepMode_Force32 = 0x7FFFFFFF
} WGPUVertexStepMode ;
typedef enum WGPUWaitStatus {
    WGPUWaitStatus_Success = 0x00000001,
    WGPUWaitStatus_TimedOut = 0x00000002,
    WGPUWaitStatus_Error = 0x00000003,
    WGPUWaitStatus_Force32 = 0x7FFFFFFF
} WGPUWaitStatus ;
typedef enum WGPUWGSLLanguageFeatureName {
    WGPUWGSLLanguageFeatureName_ReadonlyAndReadwriteStorageTextures = 0x00000001,
    WGPUWGSLLanguageFeatureName_Packed4x8IntegerDotProduct = 0x00000002,
    WGPUWGSLLanguageFeatureName_UnrestrictedPointerParameters = 0x00000003,
    WGPUWGSLLanguageFeatureName_PointerCompositeAccess = 0x00000004,
    WGPUWGSLLanguageFeatureName_UniformBufferStandardLayout = 0x00000005,
    WGPUWGSLLanguageFeatureName_SubgroupId = 0x00000006,
    WGPUWGSLLanguageFeatureName_SizedBindingArray = 0x00050007,
    WGPUWGSLLanguageFeatureName_TexelBuffers = 0x00050008,
    WGPUWGSLLanguageFeatureName_ChromiumPrint = 0x00050009,
    WGPUWGSLLanguageFeatureName_FragmentDepth = 0x0005000A,
    WGPUWGSLLanguageFeatureName_ImmediateAddressSpace = 0x0005000B,
    WGPUWGSLLanguageFeatureName_SubgroupUniformity = 0x0005000C,
    WGPUWGSLLanguageFeatureName_TextureAndSamplerLet = 0x0005000D,
    WGPUWGSLLanguageFeatureName_BufferView = 0x0005000E,
    WGPUWGSLLanguageFeatureName_ChromiumTestingUnimplemented = 0x00050000,
    WGPUWGSLLanguageFeatureName_ChromiumTestingUnsafeExperimental = 0x00050001,
    WGPUWGSLLanguageFeatureName_ChromiumTestingExperimental = 0x00050002,
    WGPUWGSLLanguageFeatureName_ChromiumTestingShippedWithKillswitch = 0x00050003,
    WGPUWGSLLanguageFeatureName_ChromiumTestingShipped = 0x00050004,
    WGPUWGSLLanguageFeatureName_Force32 = 0x7FFFFFFF
} WGPUWGSLLanguageFeatureName ;
typedef WGPUFlags WGPUBufferUsage;
enum { WGPUBufferUsage_None = 0x0000000000000000 };
enum { WGPUBufferUsage_MapRead = 0x0000000000000001 };
enum { WGPUBufferUsage_MapWrite = 0x0000000000000002 };
enum { WGPUBufferUsage_CopySrc = 0x0000000000000004 };
enum { WGPUBufferUsage_CopyDst = 0x0000000000000008 };
enum { WGPUBufferUsage_Index = 0x0000000000000010 };
enum { WGPUBufferUsage_Vertex = 0x0000000000000020 };
enum { WGPUBufferUsage_Uniform = 0x0000000000000040 };
enum { WGPUBufferUsage_Storage = 0x0000000000000080 };
enum { WGPUBufferUsage_Indirect = 0x0000000000000100 };
enum { WGPUBufferUsage_QueryResolve = 0x0000000000000200 };
enum { WGPUBufferUsage_TexelBuffer = 0x0000000000000400 };
typedef WGPUFlags WGPUColorWriteMask;
enum { WGPUColorWriteMask_None = 0x0000000000000000 };
enum { WGPUColorWriteMask_Red = 0x0000000000000001 };
enum { WGPUColorWriteMask_Green = 0x0000000000000002 };
enum { WGPUColorWriteMask_Blue = 0x0000000000000004 };
enum { WGPUColorWriteMask_Alpha = 0x0000000000000008 };
enum { WGPUColorWriteMask_All = 0x000000000000000F };
typedef WGPUFlags WGPUHeapProperty;
enum { WGPUHeapProperty_None = 0x0000000000000000 };
enum { WGPUHeapProperty_DeviceLocal = 0x0000000000000001 };
enum { WGPUHeapProperty_HostVisible = 0x0000000000000002 };
enum { WGPUHeapProperty_HostCoherent = 0x0000000000000004 };
enum { WGPUHeapProperty_HostUncached = 0x0000000000000008 };
enum { WGPUHeapProperty_HostCached = 0x0000000000000010 };
typedef WGPUFlags WGPUMapMode;
enum { WGPUMapMode_None = 0x0000000000000000 };
enum { WGPUMapMode_Read = 0x0000000000000001 };
enum { WGPUMapMode_Write = 0x0000000000000002 };
typedef WGPUFlags WGPUShaderStage;
enum { WGPUShaderStage_None = 0x0000000000000000 };
enum { WGPUShaderStage_Vertex = 0x0000000000000001 };
enum { WGPUShaderStage_Fragment = 0x0000000000000002 };
enum { WGPUShaderStage_Compute = 0x0000000000000004 };
typedef WGPUFlags WGPUTextureUsage;
enum { WGPUTextureUsage_None = 0x0000000000000000 };
enum { WGPUTextureUsage_CopySrc = 0x0000000000000001 };
enum { WGPUTextureUsage_CopyDst = 0x0000000000000002 };
enum { WGPUTextureUsage_TextureBinding = 0x0000000000000004 };
enum { WGPUTextureUsage_StorageBinding = 0x0000000000000008 };
enum { WGPUTextureUsage_RenderAttachment = 0x0000000000000010 };
enum { WGPUTextureUsage_TransientAttachment = 0x0000000000000020 };
enum { WGPUTextureUsage_StorageAttachment = 0x0000000000000040 };
typedef void (*WGPUCallback)(void * userdata) ;
typedef size_t (*WGPUDawnLoadCacheDataFunction)(void const * key, size_t keySize, void * value, size_t valueSize, void * userdata) ;
typedef void (*WGPUDawnStoreCacheDataFunction)(void const * key, size_t keySize, void const * value, size_t valueSize, void * userdata) ;
typedef void (*WGPUProc)(void) ;
typedef void (*WGPUBufferMapCallback)(WGPUMapAsyncStatus status, WGPUStringView message, void* userdata1, void* userdata2) ;
typedef void (*WGPUCompilationInfoCallback)(WGPUCompilationInfoRequestStatus status, struct WGPUCompilationInfo const * compilationInfo, void* userdata1, void* userdata2) ;
typedef void (*WGPUCreateComputePipelineAsyncCallback)(WGPUCreatePipelineAsyncStatus status, WGPUComputePipeline pipeline, WGPUStringView message, void* userdata1, void* userdata2) ;
typedef void (*WGPUCreateRenderPipelineAsyncCallback)(WGPUCreatePipelineAsyncStatus status, WGPURenderPipeline pipeline, WGPUStringView message, void* userdata1, void* userdata2) ;
typedef void (*WGPUDeviceLostCallback)(WGPUDevice const * device, WGPUDeviceLostReason reason, WGPUStringView message, void* userdata1, void* userdata2) ;
typedef void (*WGPULoggingCallback)(WGPULoggingType type, WGPUStringView message, void* userdata1, void* userdata2) ;
typedef void (*WGPUPopErrorScopeCallback)(WGPUPopErrorScopeStatus status, WGPUErrorType type, WGPUStringView message, void* userdata1, void* userdata2) ;
typedef void (*WGPUQueueWorkDoneCallback)(WGPUQueueWorkDoneStatus status, WGPUStringView message, void* userdata1, void* userdata2) ;
typedef void (*WGPURequestAdapterCallback)(WGPURequestAdapterStatus status, WGPUAdapter adapter, WGPUStringView message, void* userdata1, void* userdata2) ;
typedef void (*WGPURequestDeviceCallback)(WGPURequestDeviceStatus status, WGPUDevice device, WGPUStringView message, void* userdata1, void* userdata2) ;
typedef void (*WGPUUncapturedErrorCallback)(WGPUDevice const * device, WGPUErrorType type, WGPUStringView message, void* userdata1, void* userdata2) ;
typedef struct WGPUChainedStruct {
    struct WGPUChainedStruct * next;
    WGPUSType sType;
} WGPUChainedStruct ;
typedef struct WGPUBufferMapCallbackInfo {
    WGPUChainedStruct * nextInChain;
    WGPUCallbackMode mode;
    WGPUBufferMapCallback callback;
    void* userdata1;
    void* userdata2;
} WGPUBufferMapCallbackInfo ;
typedef struct WGPUCompilationInfoCallbackInfo {
    WGPUChainedStruct * nextInChain;
    WGPUCallbackMode mode;
    WGPUCompilationInfoCallback callback;
    void* userdata1;
    void* userdata2;
} WGPUCompilationInfoCallbackInfo ;
typedef struct WGPUCreateComputePipelineAsyncCallbackInfo {
    WGPUChainedStruct * nextInChain;
    WGPUCallbackMode mode;
    WGPUCreateComputePipelineAsyncCallback callback;
    void* userdata1;
    void* userdata2;
} WGPUCreateComputePipelineAsyncCallbackInfo ;
typedef struct WGPUCreateRenderPipelineAsyncCallbackInfo {
    WGPUChainedStruct * nextInChain;
    WGPUCallbackMode mode;
    WGPUCreateRenderPipelineAsyncCallback callback;
    void* userdata1;
    void* userdata2;
} WGPUCreateRenderPipelineAsyncCallbackInfo ;
typedef struct WGPUDeviceLostCallbackInfo {
    WGPUChainedStruct * nextInChain;
    WGPUCallbackMode mode;
    WGPUDeviceLostCallback callback;
    void* userdata1;
    void* userdata2;
} WGPUDeviceLostCallbackInfo ;
typedef struct WGPULoggingCallbackInfo {
    WGPUChainedStruct * nextInChain;
    WGPULoggingCallback callback;
    void* userdata1;
    void* userdata2;
} WGPULoggingCallbackInfo ;
typedef struct WGPUPopErrorScopeCallbackInfo {
    WGPUChainedStruct * nextInChain;
    WGPUCallbackMode mode;
    WGPUPopErrorScopeCallback callback;
    void* userdata1;
    void* userdata2;
} WGPUPopErrorScopeCallbackInfo ;
typedef struct WGPUQueueWorkDoneCallbackInfo {
    WGPUChainedStruct * nextInChain;
    WGPUCallbackMode mode;
    WGPUQueueWorkDoneCallback callback;
    void* userdata1;
    void* userdata2;
} WGPUQueueWorkDoneCallbackInfo ;
typedef struct WGPURequestAdapterCallbackInfo {
    WGPUChainedStruct * nextInChain;
    WGPUCallbackMode mode;
    WGPURequestAdapterCallback callback;
    void* userdata1;
    void* userdata2;
} WGPURequestAdapterCallbackInfo ;
typedef struct WGPURequestDeviceCallbackInfo {
    WGPUChainedStruct * nextInChain;
    WGPUCallbackMode mode;
    WGPURequestDeviceCallback callback;
    void* userdata1;
    void* userdata2;
} WGPURequestDeviceCallbackInfo ;
typedef struct WGPUUncapturedErrorCallbackInfo {
    WGPUChainedStruct * nextInChain;
    WGPUUncapturedErrorCallback callback;
    void* userdata1;
    void* userdata2;
} WGPUUncapturedErrorCallbackInfo ;
typedef struct WGPUAdapterPropertiesD3D {
    WGPUChainedStruct chain;
    uint32_t shaderModel;
} WGPUAdapterPropertiesD3D ;
typedef struct WGPUAdapterPropertiesVk {
    WGPUChainedStruct chain;
    uint32_t driverVersion;
} WGPUAdapterPropertiesVk ;
typedef struct WGPUAdapterPropertiesWGPU {
    WGPUChainedStruct chain;
    WGPUBackendType backendType;
} WGPUAdapterPropertiesWGPU ;
typedef struct WGPUBindingResource {
    WGPUChainedStruct * nextInChain;
    WGPUBuffer buffer;
    uint64_t offset;
    uint64_t size;
    WGPUSampler sampler;
    WGPUTextureView textureView;
} WGPUBindingResource ;
typedef struct WGPUBlendComponent {
    WGPUBlendOperation operation;
    WGPUBlendFactor srcFactor;
    WGPUBlendFactor dstFactor;
} WGPUBlendComponent ;
typedef struct WGPUBufferBindingLayout {
    WGPUChainedStruct * nextInChain;
    WGPUBufferBindingType type;
    WGPUBool hasDynamicOffset;
    uint64_t minBindingSize;
} WGPUBufferBindingLayout ;
typedef struct WGPUBufferHostMappedPointer {
    WGPUChainedStruct chain;
    void * pointer;
    WGPUCallback disposeCallback;
    void * userdata;
} WGPUBufferHostMappedPointer ;
typedef struct WGPUColor {
    double r;
    double g;
    double b;
    double a;
} WGPUColor ;
typedef struct WGPUColorTargetStateExpandResolveTextureDawn {
    WGPUChainedStruct chain;
    WGPUBool enabled;
} WGPUColorTargetStateExpandResolveTextureDawn ;
typedef struct WGPUCommandBufferDescriptor {
    WGPUChainedStruct * nextInChain;
    WGPUStringView label;
} WGPUCommandBufferDescriptor ;
typedef struct WGPUCompatibilityModeLimits {
    WGPUChainedStruct chain;
    uint32_t maxStorageBuffersInVertexStage;
    uint32_t maxStorageTexturesInVertexStage;
    uint32_t maxStorageBuffersInFragmentStage;
    uint32_t maxStorageTexturesInFragmentStage;
} WGPUCompatibilityModeLimits ;
typedef struct WGPUConstantEntry {
    WGPUChainedStruct * nextInChain;
    WGPUStringView key;
    double value;
} WGPUConstantEntry ;
typedef struct WGPUCopyTextureForBrowserOptions {
    WGPUChainedStruct * nextInChain;
    WGPUBool flipY;
    WGPUBool needsColorSpaceConversion;
    WGPUAlphaMode srcAlphaMode;
    float const * srcTransferFunctionParameters;
    float const * conversionMatrix;
    float const * dstTransferFunctionParameters;
    WGPUAlphaMode dstAlphaMode;
    WGPUBool internalUsage;
} WGPUCopyTextureForBrowserOptions ;
typedef struct WGPUDawnAdapterPropertiesPowerPreference {
    WGPUChainedStruct chain;
    WGPUPowerPreference powerPreference;
} WGPUDawnAdapterPropertiesPowerPreference ;
typedef struct WGPUDawnBufferDescriptorErrorInfoFromWireClient {
    WGPUChainedStruct chain;
    WGPUBool outOfMemory;
} WGPUDawnBufferDescriptorErrorInfoFromWireClient ;
typedef struct WGPUDawnCacheDeviceDescriptor {
    WGPUChainedStruct chain;
    WGPUStringView isolationKey;
    WGPUDawnLoadCacheDataFunction loadDataFunction;
    WGPUDawnStoreCacheDataFunction storeDataFunction;
    void * functionUserdata;
} WGPUDawnCacheDeviceDescriptor ;
typedef struct WGPUDawnCompilationMessageUtf16 {
    WGPUChainedStruct chain;
    uint64_t linePos;
    uint64_t offset;
    uint64_t length;
} WGPUDawnCompilationMessageUtf16 ;
typedef struct WGPUDawnConsumeAdapterDescriptor {
    WGPUChainedStruct chain;
    WGPUBool consumeAdapter;
} WGPUDawnConsumeAdapterDescriptor ;
typedef struct WGPUDawnDeviceAllocatorControl {
    WGPUChainedStruct chain;
    size_t allocatorHeapBlockSize;
} WGPUDawnDeviceAllocatorControl ;
typedef struct WGPUDawnDrmFormatProperties {
    uint64_t modifier;
    uint32_t modifierPlaneCount;
} WGPUDawnDrmFormatProperties ;
typedef struct WGPUDawnEncoderInternalUsageDescriptor {
    WGPUChainedStruct chain;
    WGPUBool useInternalUsages;
} WGPUDawnEncoderInternalUsageDescriptor ;
typedef struct WGPUDawnFakeBufferOOMForTesting {
    WGPUChainedStruct chain;
    WGPUBool fakeOOMAtWireClientMap;
    WGPUBool fakeOOMAtNativeMap;
    WGPUBool fakeOOMAtDevice;
} WGPUDawnFakeBufferOOMForTesting ;
typedef struct WGPUDawnFakeDeviceInitializeErrorForTesting {
    WGPUChainedStruct chain;
} WGPUDawnFakeDeviceInitializeErrorForTesting ;
typedef struct WGPUDawnHostMappedPointerLimits {
    WGPUChainedStruct chain;
    uint32_t hostMappedPointerAlignment;
} WGPUDawnHostMappedPointerLimits ;
typedef struct WGPUDawnInjectedInvalidSType {
    WGPUChainedStruct chain;
    WGPUSType invalidSType;
} WGPUDawnInjectedInvalidSType ;
typedef struct WGPUDawnRenderPassColorAttachmentRenderToSingleSampled {
    WGPUChainedStruct chain;
    uint32_t implicitSampleCount;
} WGPUDawnRenderPassColorAttachmentRenderToSingleSampled ;
typedef struct WGPUDawnShaderModuleSPIRVOptionsDescriptor {
    WGPUChainedStruct chain;
    WGPUBool allowNonUniformDerivatives;
} WGPUDawnShaderModuleSPIRVOptionsDescriptor ;
typedef struct WGPUDawnTexelCopyBufferRowAlignmentLimits {
    WGPUChainedStruct chain;
    uint32_t minTexelCopyBufferRowAlignment;
} WGPUDawnTexelCopyBufferRowAlignmentLimits ;
typedef struct WGPUDawnTextureInternalUsageDescriptor {
    WGPUChainedStruct chain;
    WGPUTextureUsage internalUsage;
} WGPUDawnTextureInternalUsageDescriptor ;
typedef struct WGPUDawnTogglesDescriptor {
    WGPUChainedStruct chain;
    size_t enabledToggleCount;
    const char* const * enabledToggles;
    size_t disabledToggleCount;
    const char* const * disabledToggles;
} WGPUDawnTogglesDescriptor ;
typedef struct WGPUDawnWGSLBlocklist {
    WGPUChainedStruct chain;
    size_t blocklistedFeatureCount;
    const char* const * blocklistedFeatures;
} WGPUDawnWGSLBlocklist ;
typedef struct WGPUDawnWireWGSLControl {
    WGPUChainedStruct chain;
    WGPUBool enableExperimental;
    WGPUBool enableUnsafe;
    WGPUBool enableTesting;
} WGPUDawnWireWGSLControl ;
typedef struct WGPUEmscriptenSurfaceSourceCanvasHTMLSelector {
    WGPUChainedStruct chain;
    WGPUStringView selector;
} WGPUEmscriptenSurfaceSourceCanvasHTMLSelector ;
typedef struct WGPUExtent2D {
    uint32_t width;
    uint32_t height;
} WGPUExtent2D ;
typedef struct WGPUExtent3D {
    uint32_t width;
    uint32_t height;
    uint32_t depthOrArrayLayers;
} WGPUExtent3D ;
typedef struct WGPUExternalTextureBindingEntry {
    WGPUChainedStruct chain;
    WGPUExternalTexture externalTexture;
} WGPUExternalTextureBindingEntry ;
typedef struct WGPUExternalTextureBindingLayout {
    WGPUChainedStruct chain;
} WGPUExternalTextureBindingLayout ;
typedef struct WGPUFuture {
    uint64_t id;
} WGPUFuture ;
typedef struct WGPUInstanceLimits {
    WGPUChainedStruct * nextInChain;
    size_t timedWaitAnyMaxCount;
} WGPUInstanceLimits ;
typedef struct WGPUINTERNAL_HAVE_EMDAWNWEBGPU_HEADER {
    WGPUBool unused;
} WGPUINTERNAL_HAVE_EMDAWNWEBGPU_HEADER ;
typedef struct WGPUMemoryHeapInfo {
    WGPUHeapProperty properties;
    uint64_t size;
} WGPUMemoryHeapInfo ;
typedef struct WGPUMultisampleState {
    WGPUChainedStruct * nextInChain;
    uint32_t count;
    uint32_t mask;
    WGPUBool alphaToCoverageEnabled;
} WGPUMultisampleState ;
typedef struct WGPUOrigin2D {
    uint32_t x;
    uint32_t y;
} WGPUOrigin2D ;
typedef struct WGPUOrigin3D {
    uint32_t x;
    uint32_t y;
    uint32_t z;
} WGPUOrigin3D ;
typedef struct WGPUPassTimestampWrites {
    WGPUChainedStruct * nextInChain;
    WGPUQuerySet querySet;
    uint32_t beginningOfPassWriteIndex;
    uint32_t endOfPassWriteIndex;
} WGPUPassTimestampWrites ;
typedef struct WGPUPipelineLayoutResourceTable {
    WGPUChainedStruct chain;
    WGPUBool usesResourceTable;
} WGPUPipelineLayoutResourceTable ;
typedef struct WGPUPipelineLayoutStorageAttachment {
    WGPUChainedStruct * nextInChain;
    uint64_t offset;
    WGPUTextureFormat format;
} WGPUPipelineLayoutStorageAttachment ;
typedef struct WGPUPrimitiveState {
    WGPUChainedStruct * nextInChain;
    WGPUPrimitiveTopology topology;
    WGPUIndexFormat stripIndexFormat;
    WGPUFrontFace frontFace;
    WGPUCullMode cullMode;
    WGPUBool unclippedDepth;
} WGPUPrimitiveState ;
typedef struct WGPUQuerySetDescriptor {
    WGPUChainedStruct * nextInChain;
    WGPUStringView label;
    WGPUQueryType type;
    uint32_t count;
} WGPUQuerySetDescriptor ;
typedef struct WGPUQueueDescriptor {
    WGPUChainedStruct * nextInChain;
    WGPUStringView label;
} WGPUQueueDescriptor ;
typedef struct WGPURenderBundleDescriptor {
    WGPUChainedStruct * nextInChain;
    WGPUStringView label;
} WGPURenderBundleDescriptor ;
typedef struct WGPURenderBundleEncoderDescriptor {
    WGPUChainedStruct * nextInChain;
    WGPUStringView label;
    size_t colorFormatCount;
    WGPUTextureFormat const * colorFormats;
    WGPUTextureFormat depthStencilFormat;
    uint32_t sampleCount;
    WGPUBool depthReadOnly;
    WGPUBool stencilReadOnly;
} WGPURenderBundleEncoderDescriptor ;
typedef struct WGPURenderPassDepthStencilAttachment {
    WGPUChainedStruct * nextInChain;
    WGPUTextureView view;
    WGPULoadOp depthLoadOp;
    WGPUStoreOp depthStoreOp;
    float depthClearValue;
    WGPUBool depthReadOnly;
    WGPULoadOp stencilLoadOp;
    WGPUStoreOp stencilStoreOp;
    uint32_t stencilClearValue;
    WGPUBool stencilReadOnly;
} WGPURenderPassDepthStencilAttachment ;
typedef struct WGPURenderPassDescriptorExpandResolveRect {
    WGPUChainedStruct chain;
    uint32_t x;
    uint32_t y;
    uint32_t width;
    uint32_t height;
} WGPURenderPassDescriptorExpandResolveRect ;
typedef struct WGPURenderPassDescriptorResolveRect {
    WGPUChainedStruct chain;
    uint32_t colorOffsetX;
    uint32_t colorOffsetY;
    uint32_t resolveOffsetX;
    uint32_t resolveOffsetY;
    uint32_t width;
    uint32_t height;
} WGPURenderPassDescriptorResolveRect ;
typedef struct WGPURenderPassMaxDrawCount {
    WGPUChainedStruct chain;
    uint64_t maxDrawCount;
} WGPURenderPassMaxDrawCount ;
typedef struct WGPURequestAdapterWebGPUBackendOptions {
    WGPUChainedStruct chain;
} WGPURequestAdapterWebGPUBackendOptions ;
typedef struct WGPURequestAdapterWebXROptions {
    WGPUChainedStruct chain;
    WGPUBool xrCompatible;
} WGPURequestAdapterWebXROptions ;
typedef struct WGPUResourceTableDescriptor {
    WGPUChainedStruct * nextInChain;
    WGPUStringView label;
    uint32_t size;
} WGPUResourceTableDescriptor ;
typedef struct WGPUResourceTableLimits {
    WGPUChainedStruct chain;
    uint32_t maxResourceTableSize;
} WGPUResourceTableLimits ;
typedef struct WGPUSamplerBindingLayout {
    WGPUChainedStruct * nextInChain;
    WGPUSamplerBindingType type;
} WGPUSamplerBindingLayout ;
typedef struct WGPUShaderModuleCompilationOptions {
    WGPUChainedStruct chain;
    WGPUBool strictMath;
} WGPUShaderModuleCompilationOptions ;
typedef struct WGPUShaderSourceSPIRV {
    WGPUChainedStruct chain;
    uint32_t codeSize;
    uint32_t const * code;
} WGPUShaderSourceSPIRV ;
typedef struct WGPUShaderSourceWGSL {
    WGPUChainedStruct chain;
    WGPUStringView code;
} WGPUShaderSourceWGSL ;
typedef struct WGPUSharedBufferMemoryBeginAccessDescriptor {
    WGPUChainedStruct * nextInChain;
    WGPUBool initialized;
    size_t fenceCount;
    WGPUSharedFence const * fences;
    uint64_t const * signaledValues;
} WGPUSharedBufferMemoryBeginAccessDescriptor ;
typedef struct WGPUSharedBufferMemoryDescriptor {
    WGPUChainedStruct * nextInChain;
    WGPUStringView label;
} WGPUSharedBufferMemoryDescriptor ;
typedef struct WGPUSharedBufferMemoryEndAccessState {
    WGPUChainedStruct * nextInChain;
    WGPUBool initialized;
    size_t fenceCount;
    WGPUSharedFence const * fences;
    uint64_t const * signaledValues;
} WGPUSharedBufferMemoryEndAccessState ;
typedef struct WGPUSharedBufferMemoryProperties {
    WGPUChainedStruct * nextInChain;
    WGPUBufferUsage usage;
    uint64_t size;
} WGPUSharedBufferMemoryProperties ;
typedef struct WGPUSharedFenceDXGISharedHandleDescriptor {
    WGPUChainedStruct chain;
    void * handle;
} WGPUSharedFenceDXGISharedHandleDescriptor ;
typedef struct WGPUSharedFenceDXGISharedHandleExportInfo {
    WGPUChainedStruct chain;
    void * handle;
} WGPUSharedFenceDXGISharedHandleExportInfo ;
typedef struct WGPUSharedFenceEGLSyncDescriptor {
    WGPUChainedStruct chain;
    void * sync;
} WGPUSharedFenceEGLSyncDescriptor ;
typedef struct WGPUSharedFenceEGLSyncExportInfo {
    WGPUChainedStruct chain;
    void * sync;
} WGPUSharedFenceEGLSyncExportInfo ;
typedef struct WGPUSharedFenceMTLSharedEventDescriptor {
    WGPUChainedStruct chain;
    void * sharedEvent;
} WGPUSharedFenceMTLSharedEventDescriptor ;
typedef struct WGPUSharedFenceMTLSharedEventExportInfo {
    WGPUChainedStruct chain;
    void * sharedEvent;
} WGPUSharedFenceMTLSharedEventExportInfo ;
typedef struct WGPUSharedFenceSyncFDDescriptor {
    WGPUChainedStruct chain;
    int handle;
} WGPUSharedFenceSyncFDDescriptor ;
typedef struct WGPUSharedFenceSyncFDExportInfo {
    WGPUChainedStruct chain;
    int handle;
} WGPUSharedFenceSyncFDExportInfo ;
typedef struct WGPUSharedFenceVkSemaphoreOpaqueFDDescriptor {
    WGPUChainedStruct chain;
    int handle;
} WGPUSharedFenceVkSemaphoreOpaqueFDDescriptor ;
typedef struct WGPUSharedFenceVkSemaphoreOpaqueFDExportInfo {
    WGPUChainedStruct chain;
    int handle;
} WGPUSharedFenceVkSemaphoreOpaqueFDExportInfo ;
typedef struct WGPUSharedFenceVkSemaphoreZirconHandleDescriptor {
    WGPUChainedStruct chain;
    uint32_t handle;
} WGPUSharedFenceVkSemaphoreZirconHandleDescriptor ;
typedef struct WGPUSharedFenceVkSemaphoreZirconHandleExportInfo {
    WGPUChainedStruct chain;
    uint32_t handle;
} WGPUSharedFenceVkSemaphoreZirconHandleExportInfo ;
typedef struct WGPUSharedTextureMemoryAHardwareBufferDescriptor {
    WGPUChainedStruct chain;
    void * handle;
    WGPUBool useExternalFormat;
} WGPUSharedTextureMemoryAHardwareBufferDescriptor ;
typedef struct WGPUSharedTextureMemoryD3D11BeginState {
    WGPUChainedStruct chain;
    WGPUBool requiresEndAccessFence;
} WGPUSharedTextureMemoryD3D11BeginState ;
typedef struct WGPUSharedTextureMemoryD3DSwapchainBeginState {
    WGPUChainedStruct chain;
    WGPUBool isSwapchain;
} WGPUSharedTextureMemoryD3DSwapchainBeginState ;
typedef struct WGPUSharedTextureMemoryDmaBufPlane {
    int fd;
    uint64_t offset;
    uint32_t stride;
} WGPUSharedTextureMemoryDmaBufPlane ;
typedef struct WGPUSharedTextureMemoryDXGISharedHandleDescriptor {
    WGPUChainedStruct chain;
    void * handle;
    WGPUBool useKeyedMutex;
} WGPUSharedTextureMemoryDXGISharedHandleDescriptor ;
typedef struct WGPUSharedTextureMemoryEGLImageDescriptor {
    WGPUChainedStruct chain;
    void * image;
} WGPUSharedTextureMemoryEGLImageDescriptor ;
typedef struct WGPUSharedTextureMemoryIOSurfaceDescriptor {
    WGPUChainedStruct chain;
    void * ioSurface;
    WGPUBool allowStorageBinding;
} WGPUSharedTextureMemoryIOSurfaceDescriptor ;
typedef struct WGPUSharedTextureMemoryOpaqueFDDescriptor {
    WGPUChainedStruct chain;
    void const * vkImageCreateInfo;
    int memoryFD;
    uint32_t memoryTypeIndex;
    uint64_t allocationSize;
    WGPUBool dedicatedAllocation;
} WGPUSharedTextureMemoryOpaqueFDDescriptor ;
typedef struct WGPUSharedTextureMemoryVkDedicatedAllocationDescriptor {
    WGPUChainedStruct chain;
    WGPUBool dedicatedAllocation;
} WGPUSharedTextureMemoryVkDedicatedAllocationDescriptor ;
typedef struct WGPUSharedTextureMemoryVkImageLayoutBeginState {
    WGPUChainedStruct chain;
    int32_t oldLayout;
    int32_t newLayout;
} WGPUSharedTextureMemoryVkImageLayoutBeginState ;
typedef struct WGPUSharedTextureMemoryVkImageLayoutEndState {
    WGPUChainedStruct chain;
    int32_t oldLayout;
    int32_t newLayout;
} WGPUSharedTextureMemoryVkImageLayoutEndState ;
typedef struct WGPUSharedTextureMemoryZirconHandleDescriptor {
    WGPUChainedStruct chain;
    uint32_t memoryFD;
    uint64_t allocationSize;
} WGPUSharedTextureMemoryZirconHandleDescriptor ;
typedef struct WGPUStaticSamplerBindingLayout {
    WGPUChainedStruct chain;
    WGPUSampler sampler;
    uint32_t sampledTextureBinding;
} WGPUStaticSamplerBindingLayout ;
typedef struct WGPUStencilFaceState {
    WGPUCompareFunction compare;
    WGPUStencilOperation failOp;
    WGPUStencilOperation depthFailOp;
    WGPUStencilOperation passOp;
} WGPUStencilFaceState ;
typedef struct WGPUStorageTextureBindingLayout {
    WGPUChainedStruct * nextInChain;
    WGPUStorageTextureAccess access;
    WGPUTextureFormat format;
    WGPUTextureViewDimension viewDimension;
} WGPUStorageTextureBindingLayout ;
typedef struct WGPUSubgroupMatrixConfig {
    WGPUSubgroupMatrixComponentType componentType;
    WGPUSubgroupMatrixComponentType resultComponentType;
    uint32_t M;
    uint32_t N;
    uint32_t K;
} WGPUSubgroupMatrixConfig ;
typedef struct WGPUSupportedFeatures {
    size_t featureCount;
    WGPUFeatureName const * features;
} WGPUSupportedFeatures ;
typedef struct WGPUSupportedInstanceFeatures {
    size_t featureCount;
    WGPUInstanceFeatureName const * features;
} WGPUSupportedInstanceFeatures ;
typedef struct WGPUSupportedWGSLLanguageFeatures {
    size_t featureCount;
    WGPUWGSLLanguageFeatureName const * features;
} WGPUSupportedWGSLLanguageFeatures ;
typedef struct WGPUSurfaceCapabilities {
    WGPUChainedStruct * nextInChain;
    WGPUTextureUsage usages;
    size_t formatCount;
    WGPUTextureFormat const * formats;
    size_t presentModeCount;
    WGPUPresentMode const * presentModes;
    size_t alphaModeCount;
    WGPUCompositeAlphaMode const * alphaModes;
} WGPUSurfaceCapabilities ;
typedef struct WGPUSurfaceColorManagement {
    WGPUChainedStruct chain;
    WGPUPredefinedColorSpace colorSpace;
    WGPUToneMappingMode toneMappingMode;
} WGPUSurfaceColorManagement ;
typedef struct WGPUSurfaceConfiguration {
    WGPUChainedStruct * nextInChain;
    WGPUDevice device;
    WGPUTextureFormat format;
    WGPUTextureUsage usage;
    uint32_t width;
    uint32_t height;
    size_t viewFormatCount;
    WGPUTextureFormat const * viewFormats;
    WGPUCompositeAlphaMode alphaMode;
    WGPUPresentMode presentMode;
} WGPUSurfaceConfiguration ;
typedef struct WGPUSurfaceDescriptorFromWindowsCoreWindow {
    WGPUChainedStruct chain;
    void * coreWindow;
} WGPUSurfaceDescriptorFromWindowsCoreWindow ;
typedef struct WGPUSurfaceDescriptorFromWindowsUWPSwapChainPanel {
    WGPUChainedStruct chain;
    void * swapChainPanel;
} WGPUSurfaceDescriptorFromWindowsUWPSwapChainPanel ;
typedef struct WGPUSurfaceDescriptorFromWindowsWinUISwapChainPanel {
    WGPUChainedStruct chain;
    void * swapChainPanel;
} WGPUSurfaceDescriptorFromWindowsWinUISwapChainPanel ;
typedef struct WGPUSurfaceSourceAndroidNativeWindow {
    WGPUChainedStruct chain;
    void * window;
} WGPUSurfaceSourceAndroidNativeWindow ;
typedef struct WGPUSurfaceSourceMetalLayer {
    WGPUChainedStruct chain;
    void * layer;
} WGPUSurfaceSourceMetalLayer ;
typedef struct WGPUSurfaceSourceWaylandSurface {
    WGPUChainedStruct chain;
    void * display;
    void * surface;
} WGPUSurfaceSourceWaylandSurface ;
typedef struct WGPUSurfaceSourceWindowsHWND {
    WGPUChainedStruct chain;
    void * hinstance;
    void * hwnd;
} WGPUSurfaceSourceWindowsHWND ;
typedef struct WGPUSurfaceSourceXCBWindow {
    WGPUChainedStruct chain;
    void * connection;
    uint32_t window;
} WGPUSurfaceSourceXCBWindow ;
typedef struct WGPUSurfaceSourceXlibWindow {
    WGPUChainedStruct chain;
    void * display;
    uint64_t window;
} WGPUSurfaceSourceXlibWindow ;
typedef struct WGPUSurfaceTexture {
    WGPUChainedStruct * nextInChain;
    WGPUTexture texture;
    WGPUSurfaceGetCurrentTextureStatus status;
} WGPUSurfaceTexture ;
typedef struct WGPUTexelBufferBindingEntry {
    WGPUChainedStruct chain;
    WGPUTexelBufferView texelBufferView;
} WGPUTexelBufferBindingEntry ;
typedef struct WGPUTexelBufferBindingLayout {
    WGPUChainedStruct chain;
    WGPUTexelBufferAccess access;
    WGPUTextureFormat format;
} WGPUTexelBufferBindingLayout ;
typedef struct WGPUTexelBufferViewDescriptor {
    WGPUChainedStruct * nextInChain;
    WGPUStringView label;
    WGPUTextureFormat format;
    uint64_t offset;
    uint64_t size;
} WGPUTexelBufferViewDescriptor ;
typedef struct WGPUTexelCopyBufferLayout {
    uint64_t offset;
    uint32_t bytesPerRow;
    uint32_t rowsPerImage;
} WGPUTexelCopyBufferLayout ;
typedef struct WGPUTextureBindingLayout {
    WGPUChainedStruct * nextInChain;
    WGPUTextureSampleType sampleType;
    WGPUTextureViewDimension viewDimension;
    WGPUBool multisampled;
} WGPUTextureBindingLayout ;
typedef struct WGPUTextureBindingViewDimensionDescriptor {
    WGPUChainedStruct chain;
    WGPUTextureViewDimension textureBindingViewDimension;
} WGPUTextureBindingViewDimensionDescriptor ;
typedef struct WGPUTextureComponentSwizzle {
    WGPUComponentSwizzle r;
    WGPUComponentSwizzle g;
    WGPUComponentSwizzle b;
    WGPUComponentSwizzle a;
} WGPUTextureComponentSwizzle ;
typedef struct WGPUVertexAttribute {
    WGPUChainedStruct * nextInChain;
    WGPUVertexFormat format;
    uint64_t offset;
    uint32_t shaderLocation;
} WGPUVertexAttribute ;
typedef struct WGPUYCbCrVkDescriptor {
    WGPUChainedStruct chain;
    uint32_t vkFormat;
    uint32_t vkYCbCrModel;
    uint32_t vkYCbCrRange;
    uint32_t vkComponentSwizzleRed;
    uint32_t vkComponentSwizzleGreen;
    uint32_t vkComponentSwizzleBlue;
    uint32_t vkComponentSwizzleAlpha;
    uint32_t vkXChromaOffset;
    uint32_t vkYChromaOffset;
    WGPUFilterMode vkChromaFilter;
    WGPUBool forceExplicitReconstruction;
    uint64_t externalFormat;
} WGPUYCbCrVkDescriptor ;
typedef struct WGPUAdapterPropertiesMemoryHeaps {
    WGPUChainedStruct chain;
    size_t heapCount;
    WGPUMemoryHeapInfo const * heapInfo;
} WGPUAdapterPropertiesMemoryHeaps ;
typedef struct WGPUAdapterPropertiesSubgroupMatrixConfigs {
    WGPUChainedStruct chain;
    size_t configCount;
    WGPUSubgroupMatrixConfig const * configs;
} WGPUAdapterPropertiesSubgroupMatrixConfigs ;
typedef struct WGPUAHardwareBufferProperties {
    WGPUYCbCrVkDescriptor yCbCrInfo;
} WGPUAHardwareBufferProperties ;
typedef struct WGPUBindGroupEntry {
    WGPUChainedStruct * nextInChain;
    uint32_t binding;
    WGPUBuffer buffer;
    uint64_t offset;
    uint64_t size;
    WGPUSampler sampler;
    WGPUTextureView textureView;
} WGPUBindGroupEntry ;
typedef struct WGPUBindGroupLayoutEntry {
    WGPUChainedStruct * nextInChain;
    uint32_t binding;
    WGPUShaderStage visibility;
    uint32_t bindingArraySize;
    WGPUBufferBindingLayout buffer;
    WGPUSamplerBindingLayout sampler;
    WGPUTextureBindingLayout texture;
    WGPUStorageTextureBindingLayout storageTexture;
} WGPUBindGroupLayoutEntry ;
typedef struct WGPUBlendState {
    WGPUBlendComponent color;
    WGPUBlendComponent alpha;
} WGPUBlendState ;
typedef struct WGPUBufferDescriptor {
    WGPUChainedStruct * nextInChain;
    WGPUStringView label;
    WGPUBufferUsage usage;
    uint64_t size;
    WGPUBool mappedAtCreation;
} WGPUBufferDescriptor ;
typedef struct WGPUCommandEncoderDescriptor {
    WGPUChainedStruct * nextInChain;
    WGPUStringView label;
} WGPUCommandEncoderDescriptor ;
typedef struct WGPUCompilationMessage {
    WGPUChainedStruct * nextInChain;
    WGPUStringView message;
    WGPUCompilationMessageType type;
    uint64_t lineNum;
    uint64_t linePos;
    uint64_t offset;
    uint64_t length;
} WGPUCompilationMessage ;
typedef struct WGPUComputePassDescriptor {
    WGPUChainedStruct * nextInChain;
    WGPUStringView label;
    WGPUPassTimestampWrites const * timestampWrites;
} WGPUComputePassDescriptor ;
typedef struct WGPUComputeState {
    WGPUChainedStruct * nextInChain;
    WGPUShaderModule module;
    WGPUStringView entryPoint;
    size_t constantCount;
    WGPUConstantEntry const * constants;
} WGPUComputeState ;
typedef struct WGPUDawnDrmFormatCapabilities {
    WGPUChainedStruct chain;
    size_t propertiesCount;
    WGPUDawnDrmFormatProperties const * properties;
} WGPUDawnDrmFormatCapabilities ;
typedef struct WGPUDepthStencilState {
    WGPUChainedStruct * nextInChain;
    WGPUTextureFormat format;
    WGPUOptionalBool depthWriteEnabled;
    WGPUCompareFunction depthCompare;
    WGPUStencilFaceState stencilFront;
    WGPUStencilFaceState stencilBack;
    uint32_t stencilReadMask;
    uint32_t stencilWriteMask;
    int32_t depthBias;
    float depthBiasSlopeScale;
    float depthBiasClamp;
} WGPUDepthStencilState ;
typedef struct WGPUExternalTextureDescriptor {
    WGPUChainedStruct * nextInChain;
    WGPUStringView label;
    WGPUTextureView plane0;
    WGPUTextureView plane1;
    WGPUOrigin2D cropOrigin;
    WGPUExtent2D cropSize;
    WGPUExtent2D apparentSize;
    WGPUBool doYuvToRgbConversionOnly;
    float const * yuvToRgbConversionMatrix;
    float const * srcTransferFunctionParameters;
    float const * dstTransferFunctionParameters;
    float const * gamutConversionMatrix;
    WGPUBool mirrored;
    WGPUExternalTextureRotation rotation;
} WGPUExternalTextureDescriptor ;
typedef struct WGPUFutureWaitInfo {
    WGPUFuture future;
    WGPUBool completed;
} WGPUFutureWaitInfo ;
typedef struct WGPUImageCopyExternalTexture {
    WGPUChainedStruct * nextInChain;
    WGPUExternalTexture externalTexture;
    WGPUOrigin3D origin;
    WGPUExtent2D naturalSize;
} WGPUImageCopyExternalTexture ;
typedef struct WGPUInstanceDescriptor {
    WGPUChainedStruct * nextInChain;
    size_t requiredFeatureCount;
    WGPUInstanceFeatureName const * requiredFeatures;
    WGPUInstanceLimits const * requiredLimits;
} WGPUInstanceDescriptor ;
typedef struct WGPULimits {
    WGPUChainedStruct * nextInChain;
    uint32_t maxTextureDimension1D;
    uint32_t maxTextureDimension2D;
    uint32_t maxTextureDimension3D;
    uint32_t maxTextureArrayLayers;
    uint32_t maxBindGroups;
    uint32_t maxBindGroupsPlusVertexBuffers;
    uint32_t maxBindingsPerBindGroup;
    uint32_t maxDynamicUniformBuffersPerPipelineLayout;
    uint32_t maxDynamicStorageBuffersPerPipelineLayout;
    uint32_t maxSampledTexturesPerShaderStage;
    uint32_t maxSamplersPerShaderStage;
    uint32_t maxStorageBuffersPerShaderStage;
    uint32_t maxStorageTexturesPerShaderStage;
    uint32_t maxUniformBuffersPerShaderStage;
    uint64_t maxUniformBufferBindingSize;
    uint64_t maxStorageBufferBindingSize;
    uint32_t minUniformBufferOffsetAlignment;
    uint32_t minStorageBufferOffsetAlignment;
    uint32_t maxVertexBuffers;
    uint64_t maxBufferSize;
    uint32_t maxVertexAttributes;
    uint32_t maxVertexBufferArrayStride;
    uint32_t maxInterStageShaderVariables;
    uint32_t maxColorAttachments;
    uint32_t maxColorAttachmentBytesPerSample;
    uint32_t maxComputeWorkgroupStorageSize;
    uint32_t maxComputeInvocationsPerWorkgroup;
    uint32_t maxComputeWorkgroupSizeX;
    uint32_t maxComputeWorkgroupSizeY;
    uint32_t maxComputeWorkgroupSizeZ;
    uint32_t maxComputeWorkgroupsPerDimension;
    uint32_t maxImmediateSize;
} WGPULimits ;
typedef struct WGPUPipelineLayoutPixelLocalStorage {
    WGPUChainedStruct chain;
    uint64_t totalPixelLocalStorageSize;
    size_t storageAttachmentCount;
    WGPUPipelineLayoutStorageAttachment const * storageAttachments;
} WGPUPipelineLayoutPixelLocalStorage ;
typedef struct WGPURenderPassColorAttachment {
    WGPUChainedStruct * nextInChain;
    WGPUTextureView view;
    uint32_t depthSlice;
    WGPUTextureView resolveTarget;
    WGPULoadOp loadOp;
    WGPUStoreOp storeOp;
    WGPUColor clearValue;
} WGPURenderPassColorAttachment ;
typedef struct WGPURenderPassStorageAttachment {
    WGPUChainedStruct * nextInChain;
    uint64_t offset;
    WGPUTextureView storage;
    WGPULoadOp loadOp;
    WGPUStoreOp storeOp;
    WGPUColor clearValue;
} WGPURenderPassStorageAttachment ;
typedef struct WGPURequestAdapterOptions {
    WGPUChainedStruct * nextInChain;
    WGPUFeatureLevel featureLevel;
    WGPUPowerPreference powerPreference;
    WGPUBool forceFallbackAdapter;
    WGPUBackendType backendType;
    WGPUSurface compatibleSurface;
} WGPURequestAdapterOptions ;
typedef struct WGPUSamplerDescriptor {
    WGPUChainedStruct * nextInChain;
    WGPUStringView label;
    WGPUAddressMode addressModeU;
    WGPUAddressMode addressModeV;
    WGPUAddressMode addressModeW;
    WGPUFilterMode magFilter;
    WGPUFilterMode minFilter;
    WGPUMipmapFilterMode mipmapFilter;
    float lodMinClamp;
    float lodMaxClamp;
    WGPUCompareFunction compare;
    uint16_t maxAnisotropy;
} WGPUSamplerDescriptor ;
typedef struct WGPUShaderModuleDescriptor {
    WGPUChainedStruct * nextInChain;
    WGPUStringView label;
} WGPUShaderModuleDescriptor ;
typedef struct WGPUSharedFenceDescriptor {
    WGPUChainedStruct * nextInChain;
    WGPUStringView label;
} WGPUSharedFenceDescriptor ;
typedef struct WGPUSharedFenceExportInfo {
    WGPUChainedStruct * nextInChain;
    WGPUSharedFenceType type;
} WGPUSharedFenceExportInfo ;
typedef struct WGPUSharedTextureMemoryAHardwareBufferProperties {
    WGPUChainedStruct chain;
    WGPUYCbCrVkDescriptor yCbCrInfo;
} WGPUSharedTextureMemoryAHardwareBufferProperties ;
typedef struct WGPUSharedTextureMemoryBeginAccessDescriptor {
    WGPUChainedStruct * nextInChain;
    WGPUBool concurrentRead;
    WGPUBool initialized;
    size_t fenceCount;
    WGPUSharedFence const * fences;
    uint64_t const * signaledValues;
} WGPUSharedTextureMemoryBeginAccessDescriptor ;
typedef struct WGPUSharedTextureMemoryDmaBufDescriptor {
    WGPUChainedStruct chain;
    WGPUExtent3D size;
    uint32_t drmFormat;
    uint64_t drmModifier;
    size_t planeCount;
    WGPUSharedTextureMemoryDmaBufPlane const * planes;
} WGPUSharedTextureMemoryDmaBufDescriptor ;
typedef struct WGPUSharedTextureMemoryMetalEndAccessState {
    WGPUChainedStruct chain;
    WGPUFuture commandsScheduledFuture;
} WGPUSharedTextureMemoryMetalEndAccessState ;
typedef struct WGPUSurfaceDescriptor {
    WGPUChainedStruct * nextInChain;
    WGPUStringView label;
} WGPUSurfaceDescriptor ;
typedef struct WGPUTexelCopyBufferInfo {
    WGPUTexelCopyBufferLayout layout;
    WGPUBuffer buffer;
} WGPUTexelCopyBufferInfo ;
typedef struct WGPUTexelCopyTextureInfo {
    WGPUTexture texture;
    uint32_t mipLevel;
    WGPUOrigin3D origin;
    WGPUTextureAspect aspect;
} WGPUTexelCopyTextureInfo ;
typedef struct WGPUTextureComponentSwizzleDescriptor {
    WGPUChainedStruct chain;
    WGPUTextureComponentSwizzle swizzle;
} WGPUTextureComponentSwizzleDescriptor ;
typedef struct WGPUTextureDescriptor {
    WGPUChainedStruct * nextInChain;
    WGPUStringView label;
    WGPUTextureUsage usage;
    WGPUTextureDimension dimension;
    WGPUExtent3D size;
    WGPUTextureFormat format;
    uint32_t mipLevelCount;
    uint32_t sampleCount;
    size_t viewFormatCount;
    WGPUTextureFormat const * viewFormats;
} WGPUTextureDescriptor ;
typedef struct WGPUVertexBufferLayout {
    WGPUChainedStruct * nextInChain;
    WGPUVertexStepMode stepMode;
    uint64_t arrayStride;
    size_t attributeCount;
    WGPUVertexAttribute const * attributes;
} WGPUVertexBufferLayout ;
typedef struct WGPUAdapterInfo {
    WGPUChainedStruct * nextInChain;
    WGPUStringView vendor;
    WGPUStringView architecture;
    WGPUStringView device;
    WGPUStringView description;
    WGPUBackendType backendType;
    WGPUAdapterType adapterType;
    uint32_t vendorID;
    uint32_t deviceID;
    uint32_t subgroupMinSize;
    uint32_t subgroupMaxSize;
} WGPUAdapterInfo ;
typedef struct WGPUBindGroupDescriptor {
    WGPUChainedStruct * nextInChain;
    WGPUStringView label;
    WGPUBindGroupLayout layout;
    size_t entryCount;
    WGPUBindGroupEntry const * entries;
} WGPUBindGroupDescriptor ;
typedef struct WGPUBindGroupLayoutDescriptor {
    WGPUChainedStruct * nextInChain;
    WGPUStringView label;
    size_t entryCount;
    WGPUBindGroupLayoutEntry const * entries;
} WGPUBindGroupLayoutDescriptor ;
typedef struct WGPUColorTargetState {
    WGPUChainedStruct * nextInChain;
    WGPUTextureFormat format;
    WGPUBlendState const * blend;
    WGPUColorWriteMask writeMask;
} WGPUColorTargetState ;
typedef struct WGPUCompilationInfo {
    WGPUChainedStruct * nextInChain;
    size_t messageCount;
    WGPUCompilationMessage const * messages;
} WGPUCompilationInfo ;
typedef struct WGPUComputePipelineDescriptor {
    WGPUChainedStruct * nextInChain;
    WGPUStringView label;
    WGPUPipelineLayout layout;
    WGPUComputeState compute;
} WGPUComputePipelineDescriptor ;
typedef struct WGPUDawnFormatCapabilities {
    WGPUChainedStruct * nextInChain;
} WGPUDawnFormatCapabilities ;
typedef struct WGPUDeviceDescriptor {
    WGPUChainedStruct * nextInChain;
    WGPUStringView label;
    size_t requiredFeatureCount;
    WGPUFeatureName const * requiredFeatures;
    WGPULimits const * requiredLimits;
    WGPUQueueDescriptor defaultQueue;
    WGPUDeviceLostCallbackInfo deviceLostCallbackInfo;
    WGPUUncapturedErrorCallbackInfo uncapturedErrorCallbackInfo;
} WGPUDeviceDescriptor ;
typedef struct WGPUPipelineLayoutDescriptor {
    WGPUChainedStruct * nextInChain;
    WGPUStringView label;
    size_t bindGroupLayoutCount;
    WGPUBindGroupLayout const * bindGroupLayouts;
    uint32_t immediateSize;
} WGPUPipelineLayoutDescriptor ;
typedef struct WGPURenderPassPixelLocalStorage {
    WGPUChainedStruct chain;
    uint64_t totalPixelLocalStorageSize;
    size_t storageAttachmentCount;
    WGPURenderPassStorageAttachment const * storageAttachments;
} WGPURenderPassPixelLocalStorage ;
typedef struct WGPUSharedTextureMemoryDescriptor {
    WGPUChainedStruct * nextInChain;
    WGPUStringView label;
} WGPUSharedTextureMemoryDescriptor ;
typedef struct WGPUSharedTextureMemoryEndAccessState {
    WGPUChainedStruct * nextInChain;
    WGPUBool initialized;
    size_t fenceCount;
    WGPUSharedFence const * fences;
    uint64_t const * signaledValues;
} WGPUSharedTextureMemoryEndAccessState ;
typedef struct WGPUSharedTextureMemoryProperties {
    WGPUChainedStruct * nextInChain;
    WGPUTextureUsage usage;
    WGPUExtent3D size;
    WGPUTextureFormat format;
} WGPUSharedTextureMemoryProperties ;
typedef struct WGPUTextureViewDescriptor {
    WGPUChainedStruct * nextInChain;
    WGPUStringView label;
    WGPUTextureFormat format;
    WGPUTextureViewDimension dimension;
    uint32_t baseMipLevel;
    uint32_t mipLevelCount;
    uint32_t baseArrayLayer;
    uint32_t arrayLayerCount;
    WGPUTextureAspect aspect;
    WGPUTextureUsage usage;
} WGPUTextureViewDescriptor ;
typedef struct WGPUVertexState {
    WGPUChainedStruct * nextInChain;
    WGPUShaderModule module;
    WGPUStringView entryPoint;
    size_t constantCount;
    WGPUConstantEntry const * constants;
    size_t bufferCount;
    WGPUVertexBufferLayout const * buffers;
} WGPUVertexState ;
typedef struct WGPUFragmentState {
    WGPUChainedStruct * nextInChain;
    WGPUShaderModule module;
    WGPUStringView entryPoint;
    size_t constantCount;
    WGPUConstantEntry const * constants;
    size_t targetCount;
    WGPUColorTargetState const * targets;
} WGPUFragmentState ;
typedef struct WGPURenderPassDescriptor {
    WGPUChainedStruct * nextInChain;
    WGPUStringView label;
    size_t colorAttachmentCount;
    WGPURenderPassColorAttachment const * colorAttachments;
    WGPURenderPassDepthStencilAttachment const * depthStencilAttachment;
    WGPUQuerySet occlusionQuerySet;
    WGPUPassTimestampWrites const * timestampWrites;
} WGPURenderPassDescriptor ;
typedef struct WGPURenderPipelineDescriptor {
    WGPUChainedStruct * nextInChain;
    WGPUStringView label;
    WGPUPipelineLayout layout;
    WGPUVertexState vertex;
    WGPUPrimitiveState primitive;
    WGPUDepthStencilState const * depthStencil;
    WGPUMultisampleState multisample;
    WGPUFragmentState const * fragment;
} WGPURenderPipelineDescriptor ;
 WGPUDevice emscripten_webgpu_get_device(void);
typedef WGPUInstance (*WGPUProcCreateInstance)( WGPUInstanceDescriptor const * descriptor) ;
typedef void (*WGPUProcGetInstanceFeatures)(WGPUSupportedInstanceFeatures * features) ;
typedef WGPUStatus (*WGPUProcGetInstanceLimits)(WGPUInstanceLimits * limits) ;
typedef WGPUBool (*WGPUProcHasInstanceFeature)(WGPUInstanceFeatureName feature) ;
typedef WGPUProc (*WGPUProcGetProcAddress)(WGPUStringView procName) ;
typedef WGPUDevice (*WGPUProcAdapterCreateDevice)(WGPUAdapter adapter, WGPUDeviceDescriptor const * descriptor) ;
typedef void (*WGPUProcAdapterGetFeatures)(WGPUAdapter adapter, WGPUSupportedFeatures * features) ;
typedef WGPUStatus (*WGPUProcAdapterGetFormatCapabilities)(WGPUAdapter adapter, WGPUTextureFormat format, WGPUDawnFormatCapabilities * capabilities) ;
typedef WGPUStatus (*WGPUProcAdapterGetInfo)(WGPUAdapter adapter, WGPUAdapterInfo * info) ;
typedef WGPUInstance (*WGPUProcAdapterGetInstance)(WGPUAdapter adapter) ;
typedef WGPUStatus (*WGPUProcAdapterGetLimits)(WGPUAdapter adapter, WGPULimits * limits) ;
typedef WGPUBool (*WGPUProcAdapterHasFeature)(WGPUAdapter adapter, WGPUFeatureName feature) ;
typedef WGPUFuture (*WGPUProcAdapterRequestDevice)(WGPUAdapter adapter, WGPUDeviceDescriptor const * descriptor, WGPURequestDeviceCallbackInfo callbackInfo) ;
typedef void (*WGPUProcAdapterAddRef)(WGPUAdapter adapter) ;
typedef void (*WGPUProcAdapterRelease)(WGPUAdapter adapter) ;
typedef void (*WGPUProcAdapterInfoFreeMembers)(WGPUAdapterInfo adapterInfo) ;
typedef void (*WGPUProcAdapterPropertiesMemoryHeapsFreeMembers)(WGPUAdapterPropertiesMemoryHeaps adapterPropertiesMemoryHeaps) ;
typedef void (*WGPUProcAdapterPropertiesSubgroupMatrixConfigsFreeMembers)(WGPUAdapterPropertiesSubgroupMatrixConfigs adapterPropertiesSubgroupMatrixConfigs) ;
typedef void (*WGPUProcBindGroupSetLabel)(WGPUBindGroup bindGroup, WGPUStringView label) ;
typedef void (*WGPUProcBindGroupAddRef)(WGPUBindGroup bindGroup) ;
typedef void (*WGPUProcBindGroupRelease)(WGPUBindGroup bindGroup) ;
typedef void (*WGPUProcBindGroupLayoutSetLabel)(WGPUBindGroupLayout bindGroupLayout, WGPUStringView label) ;
typedef void (*WGPUProcBindGroupLayoutAddRef)(WGPUBindGroupLayout bindGroupLayout) ;
typedef void (*WGPUProcBindGroupLayoutRelease)(WGPUBindGroupLayout bindGroupLayout) ;
typedef WGPUTexelBufferView (*WGPUProcBufferCreateTexelView)(WGPUBuffer buffer, WGPUTexelBufferViewDescriptor const * descriptor) ;
typedef void (*WGPUProcBufferDestroy)(WGPUBuffer buffer) ;
typedef void const * (*WGPUProcBufferGetConstMappedRange)(WGPUBuffer buffer, size_t offset, size_t size) ;
typedef void * (*WGPUProcBufferGetMappedRange)(WGPUBuffer buffer, size_t offset, size_t size) ;
typedef WGPUBufferMapState (*WGPUProcBufferGetMapState)(WGPUBuffer buffer) ;
typedef uint64_t (*WGPUProcBufferGetSize)(WGPUBuffer buffer) ;
typedef WGPUBufferUsage (*WGPUProcBufferGetUsage)(WGPUBuffer buffer) ;
typedef WGPUFuture (*WGPUProcBufferMapAsync)(WGPUBuffer buffer, WGPUMapMode mode, size_t offset, size_t size, WGPUBufferMapCallbackInfo callbackInfo) ;
typedef WGPUStatus (*WGPUProcBufferReadMappedRange)(WGPUBuffer buffer, size_t offset, void * data, size_t size) ;
typedef void (*WGPUProcBufferSetLabel)(WGPUBuffer buffer, WGPUStringView label) ;
typedef void (*WGPUProcBufferUnmap)(WGPUBuffer buffer) ;
typedef WGPUStatus (*WGPUProcBufferWriteMappedRange)(WGPUBuffer buffer, size_t offset, void const * data, size_t size) ;
typedef void (*WGPUProcBufferAddRef)(WGPUBuffer buffer) ;
typedef void (*WGPUProcBufferRelease)(WGPUBuffer buffer) ;
typedef void (*WGPUProcCommandBufferSetLabel)(WGPUCommandBuffer commandBuffer, WGPUStringView label) ;
typedef void (*WGPUProcCommandBufferAddRef)(WGPUCommandBuffer commandBuffer) ;
typedef void (*WGPUProcCommandBufferRelease)(WGPUCommandBuffer commandBuffer) ;
typedef WGPUComputePassEncoder (*WGPUProcCommandEncoderBeginComputePass)(WGPUCommandEncoder commandEncoder, WGPUComputePassDescriptor const * descriptor) ;
typedef WGPURenderPassEncoder (*WGPUProcCommandEncoderBeginRenderPass)(WGPUCommandEncoder commandEncoder, WGPURenderPassDescriptor const * descriptor) ;
typedef void (*WGPUProcCommandEncoderClearBuffer)(WGPUCommandEncoder commandEncoder, WGPUBuffer buffer, uint64_t offset, uint64_t size) ;
typedef void (*WGPUProcCommandEncoderCopyBufferToBuffer)(WGPUCommandEncoder commandEncoder, WGPUBuffer source, uint64_t sourceOffset, WGPUBuffer destination, uint64_t destinationOffset, uint64_t size) ;
typedef void (*WGPUProcCommandEncoderCopyBufferToTexture)(WGPUCommandEncoder commandEncoder, WGPUTexelCopyBufferInfo const * source, WGPUTexelCopyTextureInfo const * destination, WGPUExtent3D const * copySize) ;
typedef void (*WGPUProcCommandEncoderCopyTextureToBuffer)(WGPUCommandEncoder commandEncoder, WGPUTexelCopyTextureInfo const * source, WGPUTexelCopyBufferInfo const * destination, WGPUExtent3D const * copySize) ;
typedef void (*WGPUProcCommandEncoderCopyTextureToTexture)(WGPUCommandEncoder commandEncoder, WGPUTexelCopyTextureInfo const * source, WGPUTexelCopyTextureInfo const * destination, WGPUExtent3D const * copySize) ;
typedef WGPUCommandBuffer (*WGPUProcCommandEncoderFinish)(WGPUCommandEncoder commandEncoder, WGPUCommandBufferDescriptor const * descriptor) ;
typedef void (*WGPUProcCommandEncoderInjectValidationError)(WGPUCommandEncoder commandEncoder, WGPUStringView message) ;
typedef void (*WGPUProcCommandEncoderInsertDebugMarker)(WGPUCommandEncoder commandEncoder, WGPUStringView markerLabel) ;
typedef void (*WGPUProcCommandEncoderPopDebugGroup)(WGPUCommandEncoder commandEncoder) ;
typedef void (*WGPUProcCommandEncoderPushDebugGroup)(WGPUCommandEncoder commandEncoder, WGPUStringView groupLabel) ;
typedef void (*WGPUProcCommandEncoderResolveQuerySet)(WGPUCommandEncoder commandEncoder, WGPUQuerySet querySet, uint32_t firstQuery, uint32_t queryCount, WGPUBuffer destination, uint64_t destinationOffset) ;
typedef void (*WGPUProcCommandEncoderSetLabel)(WGPUCommandEncoder commandEncoder, WGPUStringView label) ;
typedef void (*WGPUProcCommandEncoderSetResourceTable)(WGPUCommandEncoder commandEncoder, WGPUResourceTable table) ;
typedef void (*WGPUProcCommandEncoderWriteBuffer)(WGPUCommandEncoder commandEncoder, WGPUBuffer buffer, uint64_t bufferOffset, uint8_t const * data, uint64_t size) ;
typedef void (*WGPUProcCommandEncoderWriteTimestamp)(WGPUCommandEncoder commandEncoder, WGPUQuerySet querySet, uint32_t queryIndex) ;
typedef void (*WGPUProcCommandEncoderAddRef)(WGPUCommandEncoder commandEncoder) ;
typedef void (*WGPUProcCommandEncoderRelease)(WGPUCommandEncoder commandEncoder) ;
typedef void (*WGPUProcComputePassEncoderDispatchWorkgroups)(WGPUComputePassEncoder computePassEncoder, uint32_t workgroupCountX, uint32_t workgroupCountY, uint32_t workgroupCountZ) ;
typedef void (*WGPUProcComputePassEncoderDispatchWorkgroupsIndirect)(WGPUComputePassEncoder computePassEncoder, WGPUBuffer indirectBuffer, uint64_t indirectOffset) ;
typedef void (*WGPUProcComputePassEncoderEnd)(WGPUComputePassEncoder computePassEncoder) ;
typedef void (*WGPUProcComputePassEncoderInsertDebugMarker)(WGPUComputePassEncoder computePassEncoder, WGPUStringView markerLabel) ;
typedef void (*WGPUProcComputePassEncoderPopDebugGroup)(WGPUComputePassEncoder computePassEncoder) ;
typedef void (*WGPUProcComputePassEncoderPushDebugGroup)(WGPUComputePassEncoder computePassEncoder, WGPUStringView groupLabel) ;
typedef void (*WGPUProcComputePassEncoderSetBindGroup)(WGPUComputePassEncoder computePassEncoder, uint32_t groupIndex, WGPUBindGroup group, size_t dynamicOffsetCount, uint32_t const * dynamicOffsets) ;
typedef void (*WGPUProcComputePassEncoderSetImmediates)(WGPUComputePassEncoder computePassEncoder, uint32_t offset, void const * data, size_t size) ;
typedef void (*WGPUProcComputePassEncoderSetLabel)(WGPUComputePassEncoder computePassEncoder, WGPUStringView label) ;
typedef void (*WGPUProcComputePassEncoderSetPipeline)(WGPUComputePassEncoder computePassEncoder, WGPUComputePipeline pipeline) ;
typedef void (*WGPUProcComputePassEncoderWriteTimestamp)(WGPUComputePassEncoder computePassEncoder, WGPUQuerySet querySet, uint32_t queryIndex) ;
typedef void (*WGPUProcComputePassEncoderAddRef)(WGPUComputePassEncoder computePassEncoder) ;
typedef void (*WGPUProcComputePassEncoderRelease)(WGPUComputePassEncoder computePassEncoder) ;
typedef WGPUBindGroupLayout (*WGPUProcComputePipelineGetBindGroupLayout)(WGPUComputePipeline computePipeline, uint32_t groupIndex) ;
typedef void (*WGPUProcComputePipelineSetLabel)(WGPUComputePipeline computePipeline, WGPUStringView label) ;
typedef void (*WGPUProcComputePipelineAddRef)(WGPUComputePipeline computePipeline) ;
typedef void (*WGPUProcComputePipelineRelease)(WGPUComputePipeline computePipeline) ;
typedef void (*WGPUProcDawnDrmFormatCapabilitiesFreeMembers)(WGPUDawnDrmFormatCapabilities dawnDrmFormatCapabilities) ;
typedef WGPUBindGroup (*WGPUProcDeviceCreateBindGroup)(WGPUDevice device, WGPUBindGroupDescriptor const * descriptor) ;
typedef WGPUBindGroupLayout (*WGPUProcDeviceCreateBindGroupLayout)(WGPUDevice device, WGPUBindGroupLayoutDescriptor const * descriptor) ;
typedef WGPUBuffer (*WGPUProcDeviceCreateBuffer)(WGPUDevice device, WGPUBufferDescriptor const * descriptor) ;
typedef WGPUCommandEncoder (*WGPUProcDeviceCreateCommandEncoder)(WGPUDevice device, WGPUCommandEncoderDescriptor const * descriptor) ;
typedef WGPUComputePipeline (*WGPUProcDeviceCreateComputePipeline)(WGPUDevice device, WGPUComputePipelineDescriptor const * descriptor) ;
typedef WGPUFuture (*WGPUProcDeviceCreateComputePipelineAsync)(WGPUDevice device, WGPUComputePipelineDescriptor const * descriptor, WGPUCreateComputePipelineAsyncCallbackInfo callbackInfo) ;
typedef WGPUBuffer (*WGPUProcDeviceCreateErrorBuffer)(WGPUDevice device, WGPUBufferDescriptor const * descriptor) ;
typedef WGPUExternalTexture (*WGPUProcDeviceCreateErrorExternalTexture)(WGPUDevice device) ;
typedef WGPUShaderModule (*WGPUProcDeviceCreateErrorShaderModule)(WGPUDevice device, WGPUShaderModuleDescriptor const * descriptor, WGPUStringView errorMessage) ;
typedef WGPUTexture (*WGPUProcDeviceCreateErrorTexture)(WGPUDevice device, WGPUTextureDescriptor const * descriptor) ;
typedef WGPUExternalTexture (*WGPUProcDeviceCreateExternalTexture)(WGPUDevice device, WGPUExternalTextureDescriptor const * externalTextureDescriptor) ;
typedef WGPUPipelineLayout (*WGPUProcDeviceCreatePipelineLayout)(WGPUDevice device, WGPUPipelineLayoutDescriptor const * descriptor) ;
typedef WGPUQuerySet (*WGPUProcDeviceCreateQuerySet)(WGPUDevice device, WGPUQuerySetDescriptor const * descriptor) ;
typedef WGPURenderBundleEncoder (*WGPUProcDeviceCreateRenderBundleEncoder)(WGPUDevice device, WGPURenderBundleEncoderDescriptor const * descriptor) ;
typedef WGPURenderPipeline (*WGPUProcDeviceCreateRenderPipeline)(WGPUDevice device, WGPURenderPipelineDescriptor const * descriptor) ;
typedef WGPUFuture (*WGPUProcDeviceCreateRenderPipelineAsync)(WGPUDevice device, WGPURenderPipelineDescriptor const * descriptor, WGPUCreateRenderPipelineAsyncCallbackInfo callbackInfo) ;
typedef WGPUResourceTable (*WGPUProcDeviceCreateResourceTable)(WGPUDevice device, WGPUResourceTableDescriptor const * descriptor) ;
typedef WGPUSampler (*WGPUProcDeviceCreateSampler)(WGPUDevice device, WGPUSamplerDescriptor const * descriptor) ;
typedef WGPUShaderModule (*WGPUProcDeviceCreateShaderModule)(WGPUDevice device, WGPUShaderModuleDescriptor const * descriptor) ;
typedef WGPUTexture (*WGPUProcDeviceCreateTexture)(WGPUDevice device, WGPUTextureDescriptor const * descriptor) ;
typedef void (*WGPUProcDeviceDestroy)(WGPUDevice device) ;
typedef void (*WGPUProcDeviceForceLoss)(WGPUDevice device, WGPUDeviceLostReason type, WGPUStringView message) ;
typedef WGPUAdapter (*WGPUProcDeviceGetAdapter)(WGPUDevice device) ;
typedef WGPUStatus (*WGPUProcDeviceGetAdapterInfo)(WGPUDevice device, WGPUAdapterInfo * adapterInfo) ;
typedef WGPUStatus (*WGPUProcDeviceGetAHardwareBufferProperties)(WGPUDevice device, void * handle, WGPUAHardwareBufferProperties * properties) ;
typedef void (*WGPUProcDeviceGetFeatures)(WGPUDevice device, WGPUSupportedFeatures * features) ;
typedef WGPUStatus (*WGPUProcDeviceGetLimits)(WGPUDevice device, WGPULimits * limits) ;
typedef WGPUFuture (*WGPUProcDeviceGetLostFuture)(WGPUDevice device) ;
typedef WGPUQueue (*WGPUProcDeviceGetQueue)(WGPUDevice device) ;
typedef WGPUBool (*WGPUProcDeviceHasFeature)(WGPUDevice device, WGPUFeatureName feature) ;
typedef WGPUSharedBufferMemory (*WGPUProcDeviceImportSharedBufferMemory)(WGPUDevice device, WGPUSharedBufferMemoryDescriptor const * descriptor) ;
typedef WGPUSharedFence (*WGPUProcDeviceImportSharedFence)(WGPUDevice device, WGPUSharedFenceDescriptor const * descriptor) ;
typedef WGPUSharedTextureMemory (*WGPUProcDeviceImportSharedTextureMemory)(WGPUDevice device, WGPUSharedTextureMemoryDescriptor const * descriptor) ;
typedef void (*WGPUProcDeviceInjectError)(WGPUDevice device, WGPUErrorType type, WGPUStringView message) ;
typedef WGPUFuture (*WGPUProcDevicePopErrorScope)(WGPUDevice device, WGPUPopErrorScopeCallbackInfo callbackInfo) ;
typedef void (*WGPUProcDevicePushErrorScope)(WGPUDevice device, WGPUErrorFilter filter) ;
typedef void (*WGPUProcDeviceSetLabel)(WGPUDevice device, WGPUStringView label) ;
typedef void (*WGPUProcDeviceSetLoggingCallback)(WGPUDevice device, WGPULoggingCallbackInfo callbackInfo) ;
typedef void (*WGPUProcDeviceTick)(WGPUDevice device) ;
typedef void (*WGPUProcDeviceValidateTextureDescriptor)(WGPUDevice device, WGPUTextureDescriptor const * descriptor) ;
typedef void (*WGPUProcDeviceAddRef)(WGPUDevice device) ;
typedef void (*WGPUProcDeviceRelease)(WGPUDevice device) ;
typedef void (*WGPUProcExternalTextureDestroy)(WGPUExternalTexture externalTexture) ;
typedef void (*WGPUProcExternalTextureExpire)(WGPUExternalTexture externalTexture) ;
typedef void (*WGPUProcExternalTextureRefresh)(WGPUExternalTexture externalTexture) ;
typedef void (*WGPUProcExternalTextureSetLabel)(WGPUExternalTexture externalTexture, WGPUStringView label) ;
typedef void (*WGPUProcExternalTextureAddRef)(WGPUExternalTexture externalTexture) ;
typedef void (*WGPUProcExternalTextureRelease)(WGPUExternalTexture externalTexture) ;
typedef WGPUSurface (*WGPUProcInstanceCreateSurface)(WGPUInstance instance, WGPUSurfaceDescriptor const * descriptor) ;
typedef void (*WGPUProcInstanceGetWGSLLanguageFeatures)(WGPUInstance instance, WGPUSupportedWGSLLanguageFeatures * features) ;
typedef WGPUBool (*WGPUProcInstanceHasWGSLLanguageFeature)(WGPUInstance instance, WGPUWGSLLanguageFeatureName feature) ;
typedef void (*WGPUProcInstanceProcessEvents)(WGPUInstance instance) ;
typedef WGPUFuture (*WGPUProcInstanceRequestAdapter)(WGPUInstance instance, WGPURequestAdapterOptions const * options, WGPURequestAdapterCallbackInfo callbackInfo) ;
typedef WGPUWaitStatus (*WGPUProcInstanceWaitAny)(WGPUInstance instance, size_t futureCount, WGPUFutureWaitInfo * futures, uint64_t timeoutNS) ;
typedef void (*WGPUProcInstanceAddRef)(WGPUInstance instance) ;
typedef void (*WGPUProcInstanceRelease)(WGPUInstance instance) ;
typedef void (*WGPUProcPipelineLayoutSetLabel)(WGPUPipelineLayout pipelineLayout, WGPUStringView label) ;
typedef void (*WGPUProcPipelineLayoutAddRef)(WGPUPipelineLayout pipelineLayout) ;
typedef void (*WGPUProcPipelineLayoutRelease)(WGPUPipelineLayout pipelineLayout) ;
typedef void (*WGPUProcQuerySetDestroy)(WGPUQuerySet querySet) ;
typedef uint32_t (*WGPUProcQuerySetGetCount)(WGPUQuerySet querySet) ;
typedef WGPUQueryType (*WGPUProcQuerySetGetType)(WGPUQuerySet querySet) ;
typedef void (*WGPUProcQuerySetSetLabel)(WGPUQuerySet querySet, WGPUStringView label) ;
typedef void (*WGPUProcQuerySetAddRef)(WGPUQuerySet querySet) ;
typedef void (*WGPUProcQuerySetRelease)(WGPUQuerySet querySet) ;
typedef void (*WGPUProcQueueCopyExternalTextureForBrowser)(WGPUQueue queue, WGPUImageCopyExternalTexture const * source, WGPUTexelCopyTextureInfo const * destination, WGPUExtent3D const * copySize, WGPUCopyTextureForBrowserOptions const * options) ;
typedef void (*WGPUProcQueueCopyTextureForBrowser)(WGPUQueue queue, WGPUTexelCopyTextureInfo const * source, WGPUTexelCopyTextureInfo const * destination, WGPUExtent3D const * copySize, WGPUCopyTextureForBrowserOptions const * options) ;
typedef WGPUFuture (*WGPUProcQueueOnSubmittedWorkDone)(WGPUQueue queue, WGPUQueueWorkDoneCallbackInfo callbackInfo) ;
typedef void (*WGPUProcQueueSetLabel)(WGPUQueue queue, WGPUStringView label) ;
typedef void (*WGPUProcQueueSubmit)(WGPUQueue queue, size_t commandCount, WGPUCommandBuffer const * commands) ;
typedef void (*WGPUProcQueueWriteBuffer)(WGPUQueue queue, WGPUBuffer buffer, uint64_t bufferOffset, void const * data, size_t size) ;
typedef void (*WGPUProcQueueWriteTexture)(WGPUQueue queue, WGPUTexelCopyTextureInfo const * destination, void const * data, size_t dataSize, WGPUTexelCopyBufferLayout const * dataLayout, WGPUExtent3D const * writeSize) ;
typedef void (*WGPUProcQueueAddRef)(WGPUQueue queue) ;
typedef void (*WGPUProcQueueRelease)(WGPUQueue queue) ;
typedef void (*WGPUProcRenderBundleSetLabel)(WGPURenderBundle renderBundle, WGPUStringView label) ;
typedef void (*WGPUProcRenderBundleAddRef)(WGPURenderBundle renderBundle) ;
typedef void (*WGPUProcRenderBundleRelease)(WGPURenderBundle renderBundle) ;
typedef void (*WGPUProcRenderBundleEncoderDraw)(WGPURenderBundleEncoder renderBundleEncoder, uint32_t vertexCount, uint32_t instanceCount, uint32_t firstVertex, uint32_t firstInstance) ;
typedef void (*WGPUProcRenderBundleEncoderDrawIndexed)(WGPURenderBundleEncoder renderBundleEncoder, uint32_t indexCount, uint32_t instanceCount, uint32_t firstIndex, int32_t baseVertex, uint32_t firstInstance) ;
typedef void (*WGPUProcRenderBundleEncoderDrawIndexedIndirect)(WGPURenderBundleEncoder renderBundleEncoder, WGPUBuffer indirectBuffer, uint64_t indirectOffset) ;
typedef void (*WGPUProcRenderBundleEncoderDrawIndirect)(WGPURenderBundleEncoder renderBundleEncoder, WGPUBuffer indirectBuffer, uint64_t indirectOffset) ;
typedef WGPURenderBundle (*WGPUProcRenderBundleEncoderFinish)(WGPURenderBundleEncoder renderBundleEncoder, WGPURenderBundleDescriptor const * descriptor) ;
typedef void (*WGPUProcRenderBundleEncoderInsertDebugMarker)(WGPURenderBundleEncoder renderBundleEncoder, WGPUStringView markerLabel) ;
typedef void (*WGPUProcRenderBundleEncoderPopDebugGroup)(WGPURenderBundleEncoder renderBundleEncoder) ;
typedef void (*WGPUProcRenderBundleEncoderPushDebugGroup)(WGPURenderBundleEncoder renderBundleEncoder, WGPUStringView groupLabel) ;
typedef void (*WGPUProcRenderBundleEncoderSetBindGroup)(WGPURenderBundleEncoder renderBundleEncoder, uint32_t groupIndex, WGPUBindGroup group, size_t dynamicOffsetCount, uint32_t const * dynamicOffsets) ;
typedef void (*WGPUProcRenderBundleEncoderSetImmediates)(WGPURenderBundleEncoder renderBundleEncoder, uint32_t offset, void const * data, size_t size) ;
typedef void (*WGPUProcRenderBundleEncoderSetIndexBuffer)(WGPURenderBundleEncoder renderBundleEncoder, WGPUBuffer buffer, WGPUIndexFormat format, uint64_t offset, uint64_t size) ;
typedef void (*WGPUProcRenderBundleEncoderSetLabel)(WGPURenderBundleEncoder renderBundleEncoder, WGPUStringView label) ;
typedef void (*WGPUProcRenderBundleEncoderSetPipeline)(WGPURenderBundleEncoder renderBundleEncoder, WGPURenderPipeline pipeline) ;
typedef void (*WGPUProcRenderBundleEncoderSetVertexBuffer)(WGPURenderBundleEncoder renderBundleEncoder, uint32_t slot, WGPUBuffer buffer, uint64_t offset, uint64_t size) ;
typedef void (*WGPUProcRenderBundleEncoderAddRef)(WGPURenderBundleEncoder renderBundleEncoder) ;
typedef void (*WGPUProcRenderBundleEncoderRelease)(WGPURenderBundleEncoder renderBundleEncoder) ;
typedef void (*WGPUProcRenderPassEncoderBeginOcclusionQuery)(WGPURenderPassEncoder renderPassEncoder, uint32_t queryIndex) ;
typedef void (*WGPUProcRenderPassEncoderDraw)(WGPURenderPassEncoder renderPassEncoder, uint32_t vertexCount, uint32_t instanceCount, uint32_t firstVertex, uint32_t firstInstance) ;
typedef void (*WGPUProcRenderPassEncoderDrawIndexed)(WGPURenderPassEncoder renderPassEncoder, uint32_t indexCount, uint32_t instanceCount, uint32_t firstIndex, int32_t baseVertex, uint32_t firstInstance) ;
typedef void (*WGPUProcRenderPassEncoderDrawIndexedIndirect)(WGPURenderPassEncoder renderPassEncoder, WGPUBuffer indirectBuffer, uint64_t indirectOffset) ;
typedef void (*WGPUProcRenderPassEncoderDrawIndirect)(WGPURenderPassEncoder renderPassEncoder, WGPUBuffer indirectBuffer, uint64_t indirectOffset) ;
typedef void (*WGPUProcRenderPassEncoderEnd)(WGPURenderPassEncoder renderPassEncoder) ;
typedef void (*WGPUProcRenderPassEncoderEndOcclusionQuery)(WGPURenderPassEncoder renderPassEncoder) ;
typedef void (*WGPUProcRenderPassEncoderExecuteBundles)(WGPURenderPassEncoder renderPassEncoder, size_t bundleCount, WGPURenderBundle const * bundles) ;
typedef void (*WGPUProcRenderPassEncoderInsertDebugMarker)(WGPURenderPassEncoder renderPassEncoder, WGPUStringView markerLabel) ;
typedef void (*WGPUProcRenderPassEncoderMultiDrawIndexedIndirect)(WGPURenderPassEncoder renderPassEncoder, WGPUBuffer indirectBuffer, uint64_t indirectOffset, uint32_t maxDrawCount, WGPUBuffer drawCountBuffer, uint64_t drawCountBufferOffset) ;
typedef void (*WGPUProcRenderPassEncoderMultiDrawIndirect)(WGPURenderPassEncoder renderPassEncoder, WGPUBuffer indirectBuffer, uint64_t indirectOffset, uint32_t maxDrawCount, WGPUBuffer drawCountBuffer, uint64_t drawCountBufferOffset) ;
typedef void (*WGPUProcRenderPassEncoderPixelLocalStorageBarrier)(WGPURenderPassEncoder renderPassEncoder) ;
typedef void (*WGPUProcRenderPassEncoderPopDebugGroup)(WGPURenderPassEncoder renderPassEncoder) ;
typedef void (*WGPUProcRenderPassEncoderPushDebugGroup)(WGPURenderPassEncoder renderPassEncoder, WGPUStringView groupLabel) ;
typedef void (*WGPUProcRenderPassEncoderSetBindGroup)(WGPURenderPassEncoder renderPassEncoder, uint32_t groupIndex, WGPUBindGroup group, size_t dynamicOffsetCount, uint32_t const * dynamicOffsets) ;
typedef void (*WGPUProcRenderPassEncoderSetBlendConstant)(WGPURenderPassEncoder renderPassEncoder, WGPUColor const * color) ;
typedef void (*WGPUProcRenderPassEncoderSetImmediates)(WGPURenderPassEncoder renderPassEncoder, uint32_t offset, void const * data, size_t size) ;
typedef void (*WGPUProcRenderPassEncoderSetIndexBuffer)(WGPURenderPassEncoder renderPassEncoder, WGPUBuffer buffer, WGPUIndexFormat format, uint64_t offset, uint64_t size) ;
typedef void (*WGPUProcRenderPassEncoderSetLabel)(WGPURenderPassEncoder renderPassEncoder, WGPUStringView label) ;
typedef void (*WGPUProcRenderPassEncoderSetPipeline)(WGPURenderPassEncoder renderPassEncoder, WGPURenderPipeline pipeline) ;
typedef void (*WGPUProcRenderPassEncoderSetScissorRect)(WGPURenderPassEncoder renderPassEncoder, uint32_t x, uint32_t y, uint32_t width, uint32_t height) ;
typedef void (*WGPUProcRenderPassEncoderSetStencilReference)(WGPURenderPassEncoder renderPassEncoder, uint32_t reference) ;
typedef void (*WGPUProcRenderPassEncoderSetVertexBuffer)(WGPURenderPassEncoder renderPassEncoder, uint32_t slot, WGPUBuffer buffer, uint64_t offset, uint64_t size) ;
typedef void (*WGPUProcRenderPassEncoderSetViewport)(WGPURenderPassEncoder renderPassEncoder, float x, float y, float width, float height, float minDepth, float maxDepth) ;
typedef void (*WGPUProcRenderPassEncoderWriteTimestamp)(WGPURenderPassEncoder renderPassEncoder, WGPUQuerySet querySet, uint32_t queryIndex) ;
typedef void (*WGPUProcRenderPassEncoderAddRef)(WGPURenderPassEncoder renderPassEncoder) ;
typedef void (*WGPUProcRenderPassEncoderRelease)(WGPURenderPassEncoder renderPassEncoder) ;
typedef WGPUBindGroupLayout (*WGPUProcRenderPipelineGetBindGroupLayout)(WGPURenderPipeline renderPipeline, uint32_t groupIndex) ;
typedef void (*WGPUProcRenderPipelineSetLabel)(WGPURenderPipeline renderPipeline, WGPUStringView label) ;
typedef void (*WGPUProcRenderPipelineAddRef)(WGPURenderPipeline renderPipeline) ;
typedef void (*WGPUProcRenderPipelineRelease)(WGPURenderPipeline renderPipeline) ;
typedef void (*WGPUProcResourceTableDestroy)(WGPUResourceTable resourceTable) ;
typedef uint32_t (*WGPUProcResourceTableGetSize)(WGPUResourceTable resourceTable) ;
typedef uint32_t (*WGPUProcResourceTableInsertBinding)(WGPUResourceTable resourceTable, WGPUBindingResource const * resource) ;
typedef WGPUStatus (*WGPUProcResourceTableRemoveBinding)(WGPUResourceTable resourceTable, uint32_t slot) ;
typedef WGPUStatus (*WGPUProcResourceTableUpdate)(WGPUResourceTable resourceTable, uint32_t slot, WGPUBindingResource const * resource) ;
typedef void (*WGPUProcResourceTableAddRef)(WGPUResourceTable resourceTable) ;
typedef void (*WGPUProcResourceTableRelease)(WGPUResourceTable resourceTable) ;
typedef void (*WGPUProcSamplerSetLabel)(WGPUSampler sampler, WGPUStringView label) ;
typedef void (*WGPUProcSamplerAddRef)(WGPUSampler sampler) ;
typedef void (*WGPUProcSamplerRelease)(WGPUSampler sampler) ;
typedef WGPUFuture (*WGPUProcShaderModuleGetCompilationInfo)(WGPUShaderModule shaderModule, WGPUCompilationInfoCallbackInfo callbackInfo) ;
typedef void (*WGPUProcShaderModuleSetLabel)(WGPUShaderModule shaderModule, WGPUStringView label) ;
typedef void (*WGPUProcShaderModuleAddRef)(WGPUShaderModule shaderModule) ;
typedef void (*WGPUProcShaderModuleRelease)(WGPUShaderModule shaderModule) ;
typedef WGPUStatus (*WGPUProcSharedBufferMemoryBeginAccess)(WGPUSharedBufferMemory sharedBufferMemory, WGPUBuffer buffer, WGPUSharedBufferMemoryBeginAccessDescriptor const * descriptor) ;
typedef WGPUBuffer (*WGPUProcSharedBufferMemoryCreateBuffer)(WGPUSharedBufferMemory sharedBufferMemory, WGPUBufferDescriptor const * descriptor) ;
typedef WGPUStatus (*WGPUProcSharedBufferMemoryEndAccess)(WGPUSharedBufferMemory sharedBufferMemory, WGPUBuffer buffer, WGPUSharedBufferMemoryEndAccessState * descriptor) ;
typedef WGPUStatus (*WGPUProcSharedBufferMemoryGetProperties)(WGPUSharedBufferMemory sharedBufferMemory, WGPUSharedBufferMemoryProperties * properties) ;
typedef WGPUBool (*WGPUProcSharedBufferMemoryIsDeviceLost)(WGPUSharedBufferMemory sharedBufferMemory) ;
typedef void (*WGPUProcSharedBufferMemorySetLabel)(WGPUSharedBufferMemory sharedBufferMemory, WGPUStringView label) ;
typedef void (*WGPUProcSharedBufferMemoryAddRef)(WGPUSharedBufferMemory sharedBufferMemory) ;
typedef void (*WGPUProcSharedBufferMemoryRelease)(WGPUSharedBufferMemory sharedBufferMemory) ;
typedef void (*WGPUProcSharedBufferMemoryEndAccessStateFreeMembers)(WGPUSharedBufferMemoryEndAccessState sharedBufferMemoryEndAccessState) ;
typedef void (*WGPUProcSharedFenceExportInfo)(WGPUSharedFence sharedFence, WGPUSharedFenceExportInfo * info) ;
typedef void (*WGPUProcSharedFenceAddRef)(WGPUSharedFence sharedFence) ;
typedef void (*WGPUProcSharedFenceRelease)(WGPUSharedFence sharedFence) ;
typedef WGPUStatus (*WGPUProcSharedTextureMemoryBeginAccess)(WGPUSharedTextureMemory sharedTextureMemory, WGPUTexture texture, WGPUSharedTextureMemoryBeginAccessDescriptor const * descriptor) ;
typedef WGPUTexture (*WGPUProcSharedTextureMemoryCreateTexture)(WGPUSharedTextureMemory sharedTextureMemory, WGPUTextureDescriptor const * descriptor) ;
typedef WGPUStatus (*WGPUProcSharedTextureMemoryEndAccess)(WGPUSharedTextureMemory sharedTextureMemory, WGPUTexture texture, WGPUSharedTextureMemoryEndAccessState * descriptor) ;
typedef WGPUStatus (*WGPUProcSharedTextureMemoryGetProperties)(WGPUSharedTextureMemory sharedTextureMemory, WGPUSharedTextureMemoryProperties * properties) ;
typedef WGPUBool (*WGPUProcSharedTextureMemoryIsDeviceLost)(WGPUSharedTextureMemory sharedTextureMemory) ;
typedef void (*WGPUProcSharedTextureMemorySetLabel)(WGPUSharedTextureMemory sharedTextureMemory, WGPUStringView label) ;
typedef void (*WGPUProcSharedTextureMemoryAddRef)(WGPUSharedTextureMemory sharedTextureMemory) ;
typedef void (*WGPUProcSharedTextureMemoryRelease)(WGPUSharedTextureMemory sharedTextureMemory) ;
typedef void (*WGPUProcSharedTextureMemoryEndAccessStateFreeMembers)(WGPUSharedTextureMemoryEndAccessState sharedTextureMemoryEndAccessState) ;
typedef void (*WGPUProcSupportedFeaturesFreeMembers)(WGPUSupportedFeatures supportedFeatures) ;
typedef void (*WGPUProcSupportedInstanceFeaturesFreeMembers)(WGPUSupportedInstanceFeatures supportedInstanceFeatures) ;
typedef void (*WGPUProcSupportedWGSLLanguageFeaturesFreeMembers)(WGPUSupportedWGSLLanguageFeatures supportedWGSLLanguageFeatures) ;
typedef void (*WGPUProcSurfaceConfigure)(WGPUSurface surface, WGPUSurfaceConfiguration const * config) ;
typedef WGPUStatus (*WGPUProcSurfaceGetCapabilities)(WGPUSurface surface, WGPUAdapter adapter, WGPUSurfaceCapabilities * capabilities) ;
typedef void (*WGPUProcSurfaceGetCurrentTexture)(WGPUSurface surface, WGPUSurfaceTexture * surfaceTexture) ;
typedef WGPUStatus (*WGPUProcSurfacePresent)(WGPUSurface surface) ;
typedef void (*WGPUProcSurfaceSetLabel)(WGPUSurface surface, WGPUStringView label) ;
typedef void (*WGPUProcSurfaceUnconfigure)(WGPUSurface surface) ;
typedef void (*WGPUProcSurfaceAddRef)(WGPUSurface surface) ;
typedef void (*WGPUProcSurfaceRelease)(WGPUSurface surface) ;
typedef void (*WGPUProcSurfaceCapabilitiesFreeMembers)(WGPUSurfaceCapabilities surfaceCapabilities) ;
typedef void (*WGPUProcTexelBufferViewSetLabel)(WGPUTexelBufferView texelBufferView, WGPUStringView label) ;
typedef void (*WGPUProcTexelBufferViewAddRef)(WGPUTexelBufferView texelBufferView) ;
typedef void (*WGPUProcTexelBufferViewRelease)(WGPUTexelBufferView texelBufferView) ;
typedef WGPUTextureView (*WGPUProcTextureCreateErrorView)(WGPUTexture texture, WGPUTextureViewDescriptor const * descriptor) ;
typedef WGPUTextureView (*WGPUProcTextureCreateView)(WGPUTexture texture, WGPUTextureViewDescriptor const * descriptor) ;
typedef void (*WGPUProcTextureDestroy)(WGPUTexture texture) ;
typedef uint32_t (*WGPUProcTextureGetDepthOrArrayLayers)(WGPUTexture texture) ;
typedef WGPUTextureDimension (*WGPUProcTextureGetDimension)(WGPUTexture texture) ;
typedef WGPUTextureFormat (*WGPUProcTextureGetFormat)(WGPUTexture texture) ;
typedef uint32_t (*WGPUProcTextureGetHeight)(WGPUTexture texture) ;
typedef uint32_t (*WGPUProcTextureGetMipLevelCount)(WGPUTexture texture) ;
typedef uint32_t (*WGPUProcTextureGetSampleCount)(WGPUTexture texture) ;
typedef WGPUTextureViewDimension (*WGPUProcTextureGetTextureBindingViewDimension)(WGPUTexture texture) ;
typedef WGPUTextureUsage (*WGPUProcTextureGetUsage)(WGPUTexture texture) ;
typedef uint32_t (*WGPUProcTextureGetWidth)(WGPUTexture texture) ;
typedef void (*WGPUProcTexturePin)(WGPUTexture texture, WGPUTextureUsage usage) ;
typedef void (*WGPUProcTextureSetLabel)(WGPUTexture texture, WGPUStringView label) ;
typedef void (*WGPUProcTextureSetOwnershipForMemoryDump)(WGPUTexture texture, uint64_t ownerGuid) ;
typedef void (*WGPUProcTextureUnpin)(WGPUTexture texture) ;
typedef void (*WGPUProcTextureAddRef)(WGPUTexture texture) ;
typedef void (*WGPUProcTextureRelease)(WGPUTexture texture) ;
typedef void (*WGPUProcTextureViewSetLabel)(WGPUTextureView textureView, WGPUStringView label) ;
typedef void (*WGPUProcTextureViewAddRef)(WGPUTextureView textureView) ;
typedef void (*WGPUProcTextureViewRelease)(WGPUTextureView textureView) ;
 WGPUInstance wgpuCreateInstance( WGPUInstanceDescriptor const * descriptor) ;
 void wgpuGetInstanceFeatures(WGPUSupportedInstanceFeatures * features) ;
 WGPUStatus wgpuGetInstanceLimits(WGPUInstanceLimits * limits) ;
 WGPUBool wgpuHasInstanceFeature(WGPUInstanceFeatureName feature) ;
 WGPUProc wgpuGetProcAddress(WGPUStringView procName) ;
 WGPUDevice wgpuAdapterCreateDevice(WGPUAdapter adapter, WGPUDeviceDescriptor const * descriptor) ;
 void wgpuAdapterGetFeatures(WGPUAdapter adapter, WGPUSupportedFeatures * features) ;
 WGPUStatus wgpuAdapterGetFormatCapabilities(WGPUAdapter adapter, WGPUTextureFormat format, WGPUDawnFormatCapabilities * capabilities) ;
 WGPUStatus wgpuAdapterGetInfo(WGPUAdapter adapter, WGPUAdapterInfo * info) ;
 WGPUInstance wgpuAdapterGetInstance(WGPUAdapter adapter) ;
 WGPUStatus wgpuAdapterGetLimits(WGPUAdapter adapter, WGPULimits * limits) ;
 WGPUBool wgpuAdapterHasFeature(WGPUAdapter adapter, WGPUFeatureName feature) ;
 WGPUFuture wgpuAdapterRequestDevice(WGPUAdapter adapter, WGPUDeviceDescriptor const * descriptor, WGPURequestDeviceCallbackInfo callbackInfo) ;
 void wgpuAdapterAddRef(WGPUAdapter adapter) ;
 void wgpuAdapterRelease(WGPUAdapter adapter) ;
 void wgpuAdapterInfoFreeMembers(WGPUAdapterInfo adapterInfo) ;
 void wgpuAdapterPropertiesMemoryHeapsFreeMembers(WGPUAdapterPropertiesMemoryHeaps adapterPropertiesMemoryHeaps) ;
 void wgpuAdapterPropertiesSubgroupMatrixConfigsFreeMembers(WGPUAdapterPropertiesSubgroupMatrixConfigs adapterPropertiesSubgroupMatrixConfigs) ;
 void wgpuBindGroupSetLabel(WGPUBindGroup bindGroup, WGPUStringView label) ;
 void wgpuBindGroupAddRef(WGPUBindGroup bindGroup) ;
 void wgpuBindGroupRelease(WGPUBindGroup bindGroup) ;
 void wgpuBindGroupLayoutSetLabel(WGPUBindGroupLayout bindGroupLayout, WGPUStringView label) ;
 void wgpuBindGroupLayoutAddRef(WGPUBindGroupLayout bindGroupLayout) ;
 void wgpuBindGroupLayoutRelease(WGPUBindGroupLayout bindGroupLayout) ;
 WGPUTexelBufferView wgpuBufferCreateTexelView(WGPUBuffer buffer, WGPUTexelBufferViewDescriptor const * descriptor) ;
 void wgpuBufferDestroy(WGPUBuffer buffer) ;
 void const * wgpuBufferGetConstMappedRange(WGPUBuffer buffer, size_t offset, size_t size) ;
 void * wgpuBufferGetMappedRange(WGPUBuffer buffer, size_t offset, size_t size) ;
 WGPUBufferMapState wgpuBufferGetMapState(WGPUBuffer buffer) ;
 uint64_t wgpuBufferGetSize(WGPUBuffer buffer) ;
 WGPUBufferUsage wgpuBufferGetUsage(WGPUBuffer buffer) ;
 WGPUFuture wgpuBufferMapAsync(WGPUBuffer buffer, WGPUMapMode mode, size_t offset, size_t size, WGPUBufferMapCallbackInfo callbackInfo) ;
 WGPUStatus wgpuBufferReadMappedRange(WGPUBuffer buffer, size_t offset, void * data, size_t size) ;
 void wgpuBufferSetLabel(WGPUBuffer buffer, WGPUStringView label) ;
 void wgpuBufferUnmap(WGPUBuffer buffer) ;
 WGPUStatus wgpuBufferWriteMappedRange(WGPUBuffer buffer, size_t offset, void const * data, size_t size) ;
 void wgpuBufferAddRef(WGPUBuffer buffer) ;
 void wgpuBufferRelease(WGPUBuffer buffer) ;
 void wgpuCommandBufferSetLabel(WGPUCommandBuffer commandBuffer, WGPUStringView label) ;
 void wgpuCommandBufferAddRef(WGPUCommandBuffer commandBuffer) ;
 void wgpuCommandBufferRelease(WGPUCommandBuffer commandBuffer) ;
 WGPUComputePassEncoder wgpuCommandEncoderBeginComputePass(WGPUCommandEncoder commandEncoder, WGPUComputePassDescriptor const * descriptor) ;
 WGPURenderPassEncoder wgpuCommandEncoderBeginRenderPass(WGPUCommandEncoder commandEncoder, WGPURenderPassDescriptor const * descriptor) ;
 void wgpuCommandEncoderClearBuffer(WGPUCommandEncoder commandEncoder, WGPUBuffer buffer, uint64_t offset, uint64_t size) ;
 void wgpuCommandEncoderCopyBufferToBuffer(WGPUCommandEncoder commandEncoder, WGPUBuffer source, uint64_t sourceOffset, WGPUBuffer destination, uint64_t destinationOffset, uint64_t size) ;
 void wgpuCommandEncoderCopyBufferToTexture(WGPUCommandEncoder commandEncoder, WGPUTexelCopyBufferInfo const * source, WGPUTexelCopyTextureInfo const * destination, WGPUExtent3D const * copySize) ;
 void wgpuCommandEncoderCopyTextureToBuffer(WGPUCommandEncoder commandEncoder, WGPUTexelCopyTextureInfo const * source, WGPUTexelCopyBufferInfo const * destination, WGPUExtent3D const * copySize) ;
 void wgpuCommandEncoderCopyTextureToTexture(WGPUCommandEncoder commandEncoder, WGPUTexelCopyTextureInfo const * source, WGPUTexelCopyTextureInfo const * destination, WGPUExtent3D const * copySize) ;
 WGPUCommandBuffer wgpuCommandEncoderFinish(WGPUCommandEncoder commandEncoder, WGPUCommandBufferDescriptor const * descriptor) ;
 void wgpuCommandEncoderInjectValidationError(WGPUCommandEncoder commandEncoder, WGPUStringView message) ;
 void wgpuCommandEncoderInsertDebugMarker(WGPUCommandEncoder commandEncoder, WGPUStringView markerLabel) ;
 void wgpuCommandEncoderPopDebugGroup(WGPUCommandEncoder commandEncoder) ;
 void wgpuCommandEncoderPushDebugGroup(WGPUCommandEncoder commandEncoder, WGPUStringView groupLabel) ;
 void wgpuCommandEncoderResolveQuerySet(WGPUCommandEncoder commandEncoder, WGPUQuerySet querySet, uint32_t firstQuery, uint32_t queryCount, WGPUBuffer destination, uint64_t destinationOffset) ;
 void wgpuCommandEncoderSetLabel(WGPUCommandEncoder commandEncoder, WGPUStringView label) ;
 void wgpuCommandEncoderSetResourceTable(WGPUCommandEncoder commandEncoder, WGPUResourceTable table) ;
 void wgpuCommandEncoderWriteBuffer(WGPUCommandEncoder commandEncoder, WGPUBuffer buffer, uint64_t bufferOffset, uint8_t const * data, uint64_t size) ;
 void wgpuCommandEncoderWriteTimestamp(WGPUCommandEncoder commandEncoder, WGPUQuerySet querySet, uint32_t queryIndex) ;
 void wgpuCommandEncoderAddRef(WGPUCommandEncoder commandEncoder) ;
 void wgpuCommandEncoderRelease(WGPUCommandEncoder commandEncoder) ;
 void wgpuComputePassEncoderDispatchWorkgroups(WGPUComputePassEncoder computePassEncoder, uint32_t workgroupCountX, uint32_t workgroupCountY, uint32_t workgroupCountZ) ;
 void wgpuComputePassEncoderDispatchWorkgroupsIndirect(WGPUComputePassEncoder computePassEncoder, WGPUBuffer indirectBuffer, uint64_t indirectOffset) ;
 void wgpuComputePassEncoderEnd(WGPUComputePassEncoder computePassEncoder) ;
 void wgpuComputePassEncoderInsertDebugMarker(WGPUComputePassEncoder computePassEncoder, WGPUStringView markerLabel) ;
 void wgpuComputePassEncoderPopDebugGroup(WGPUComputePassEncoder computePassEncoder) ;
 void wgpuComputePassEncoderPushDebugGroup(WGPUComputePassEncoder computePassEncoder, WGPUStringView groupLabel) ;
 void wgpuComputePassEncoderSetBindGroup(WGPUComputePassEncoder computePassEncoder, uint32_t groupIndex, WGPUBindGroup group, size_t dynamicOffsetCount, uint32_t const * dynamicOffsets) ;
 void wgpuComputePassEncoderSetImmediates(WGPUComputePassEncoder computePassEncoder, uint32_t offset, void const * data, size_t size) ;
 void wgpuComputePassEncoderSetLabel(WGPUComputePassEncoder computePassEncoder, WGPUStringView label) ;
 void wgpuComputePassEncoderSetPipeline(WGPUComputePassEncoder computePassEncoder, WGPUComputePipeline pipeline) ;
 void wgpuComputePassEncoderWriteTimestamp(WGPUComputePassEncoder computePassEncoder, WGPUQuerySet querySet, uint32_t queryIndex) ;
 void wgpuComputePassEncoderAddRef(WGPUComputePassEncoder computePassEncoder) ;
 void wgpuComputePassEncoderRelease(WGPUComputePassEncoder computePassEncoder) ;
 WGPUBindGroupLayout wgpuComputePipelineGetBindGroupLayout(WGPUComputePipeline computePipeline, uint32_t groupIndex) ;
 void wgpuComputePipelineSetLabel(WGPUComputePipeline computePipeline, WGPUStringView label) ;
 void wgpuComputePipelineAddRef(WGPUComputePipeline computePipeline) ;
 void wgpuComputePipelineRelease(WGPUComputePipeline computePipeline) ;
 void wgpuDawnDrmFormatCapabilitiesFreeMembers(WGPUDawnDrmFormatCapabilities dawnDrmFormatCapabilities) ;
 WGPUBindGroup wgpuDeviceCreateBindGroup(WGPUDevice device, WGPUBindGroupDescriptor const * descriptor) ;
 WGPUBindGroupLayout wgpuDeviceCreateBindGroupLayout(WGPUDevice device, WGPUBindGroupLayoutDescriptor const * descriptor) ;
 WGPUBuffer wgpuDeviceCreateBuffer(WGPUDevice device, WGPUBufferDescriptor const * descriptor) ;
 WGPUCommandEncoder wgpuDeviceCreateCommandEncoder(WGPUDevice device, WGPUCommandEncoderDescriptor const * descriptor) ;
 WGPUComputePipeline wgpuDeviceCreateComputePipeline(WGPUDevice device, WGPUComputePipelineDescriptor const * descriptor) ;
 WGPUFuture wgpuDeviceCreateComputePipelineAsync(WGPUDevice device, WGPUComputePipelineDescriptor const * descriptor, WGPUCreateComputePipelineAsyncCallbackInfo callbackInfo) ;
 WGPUBuffer wgpuDeviceCreateErrorBuffer(WGPUDevice device, WGPUBufferDescriptor const * descriptor) ;
 WGPUExternalTexture wgpuDeviceCreateErrorExternalTexture(WGPUDevice device) ;
 WGPUShaderModule wgpuDeviceCreateErrorShaderModule(WGPUDevice device, WGPUShaderModuleDescriptor const * descriptor, WGPUStringView errorMessage) ;
 WGPUTexture wgpuDeviceCreateErrorTexture(WGPUDevice device, WGPUTextureDescriptor const * descriptor) ;
 WGPUExternalTexture wgpuDeviceCreateExternalTexture(WGPUDevice device, WGPUExternalTextureDescriptor const * externalTextureDescriptor) ;
 WGPUPipelineLayout wgpuDeviceCreatePipelineLayout(WGPUDevice device, WGPUPipelineLayoutDescriptor const * descriptor) ;
 WGPUQuerySet wgpuDeviceCreateQuerySet(WGPUDevice device, WGPUQuerySetDescriptor const * descriptor) ;
 WGPURenderBundleEncoder wgpuDeviceCreateRenderBundleEncoder(WGPUDevice device, WGPURenderBundleEncoderDescriptor const * descriptor) ;
 WGPURenderPipeline wgpuDeviceCreateRenderPipeline(WGPUDevice device, WGPURenderPipelineDescriptor const * descriptor) ;
 WGPUFuture wgpuDeviceCreateRenderPipelineAsync(WGPUDevice device, WGPURenderPipelineDescriptor const * descriptor, WGPUCreateRenderPipelineAsyncCallbackInfo callbackInfo) ;
 WGPUResourceTable wgpuDeviceCreateResourceTable(WGPUDevice device, WGPUResourceTableDescriptor const * descriptor) ;
 WGPUSampler wgpuDeviceCreateSampler(WGPUDevice device, WGPUSamplerDescriptor const * descriptor) ;
 WGPUShaderModule wgpuDeviceCreateShaderModule(WGPUDevice device, WGPUShaderModuleDescriptor const * descriptor) ;
 WGPUTexture wgpuDeviceCreateTexture(WGPUDevice device, WGPUTextureDescriptor const * descriptor) ;
 void wgpuDeviceDestroy(WGPUDevice device) ;
 void wgpuDeviceForceLoss(WGPUDevice device, WGPUDeviceLostReason type, WGPUStringView message) ;
 WGPUAdapter wgpuDeviceGetAdapter(WGPUDevice device) ;
 WGPUStatus wgpuDeviceGetAdapterInfo(WGPUDevice device, WGPUAdapterInfo * adapterInfo) ;
 WGPUStatus wgpuDeviceGetAHardwareBufferProperties(WGPUDevice device, void * handle, WGPUAHardwareBufferProperties * properties) ;
 void wgpuDeviceGetFeatures(WGPUDevice device, WGPUSupportedFeatures * features) ;
 WGPUStatus wgpuDeviceGetLimits(WGPUDevice device, WGPULimits * limits) ;
 WGPUFuture wgpuDeviceGetLostFuture(WGPUDevice device) ;
 WGPUQueue wgpuDeviceGetQueue(WGPUDevice device) ;
 WGPUBool wgpuDeviceHasFeature(WGPUDevice device, WGPUFeatureName feature) ;
 WGPUSharedBufferMemory wgpuDeviceImportSharedBufferMemory(WGPUDevice device, WGPUSharedBufferMemoryDescriptor const * descriptor) ;
 WGPUSharedFence wgpuDeviceImportSharedFence(WGPUDevice device, WGPUSharedFenceDescriptor const * descriptor) ;
 WGPUSharedTextureMemory wgpuDeviceImportSharedTextureMemory(WGPUDevice device, WGPUSharedTextureMemoryDescriptor const * descriptor) ;
 void wgpuDeviceInjectError(WGPUDevice device, WGPUErrorType type, WGPUStringView message) ;
 WGPUFuture wgpuDevicePopErrorScope(WGPUDevice device, WGPUPopErrorScopeCallbackInfo callbackInfo) ;
 void wgpuDevicePushErrorScope(WGPUDevice device, WGPUErrorFilter filter) ;
 void wgpuDeviceSetLabel(WGPUDevice device, WGPUStringView label) ;
 void wgpuDeviceSetLoggingCallback(WGPUDevice device, WGPULoggingCallbackInfo callbackInfo) ;
 void wgpuDeviceTick(WGPUDevice device) ;
 void wgpuDeviceValidateTextureDescriptor(WGPUDevice device, WGPUTextureDescriptor const * descriptor) ;
 void wgpuDeviceAddRef(WGPUDevice device) ;
 void wgpuDeviceRelease(WGPUDevice device) ;
 void wgpuExternalTextureDestroy(WGPUExternalTexture externalTexture) ;
 void wgpuExternalTextureExpire(WGPUExternalTexture externalTexture) ;
 void wgpuExternalTextureRefresh(WGPUExternalTexture externalTexture) ;
 void wgpuExternalTextureSetLabel(WGPUExternalTexture externalTexture, WGPUStringView label) ;
 void wgpuExternalTextureAddRef(WGPUExternalTexture externalTexture) ;
 void wgpuExternalTextureRelease(WGPUExternalTexture externalTexture) ;
 WGPUSurface wgpuInstanceCreateSurface(WGPUInstance instance, WGPUSurfaceDescriptor const * descriptor) ;
 void wgpuInstanceGetWGSLLanguageFeatures(WGPUInstance instance, WGPUSupportedWGSLLanguageFeatures * features) ;
 WGPUBool wgpuInstanceHasWGSLLanguageFeature(WGPUInstance instance, WGPUWGSLLanguageFeatureName feature) ;
 void wgpuInstanceProcessEvents(WGPUInstance instance) ;
// WGPUFuture wgpuInstanceRequestAdapter(WGPUInstance instance, WGPURequestAdapterOptions const * options, WGPURequestAdapterCallbackInfo callbackInfo) ;
 WGPUWaitStatus wgpuInstanceWaitAny(WGPUInstance instance, size_t futureCount, WGPUFutureWaitInfo * futures, uint64_t timeoutNS) ;
 void wgpuInstanceAddRef(WGPUInstance instance) ;
 void wgpuInstanceRelease(WGPUInstance instance) ;
 void wgpuPipelineLayoutSetLabel(WGPUPipelineLayout pipelineLayout, WGPUStringView label) ;
 void wgpuPipelineLayoutAddRef(WGPUPipelineLayout pipelineLayout) ;
 void wgpuPipelineLayoutRelease(WGPUPipelineLayout pipelineLayout) ;
 void wgpuQuerySetDestroy(WGPUQuerySet querySet) ;
 uint32_t wgpuQuerySetGetCount(WGPUQuerySet querySet) ;
 WGPUQueryType wgpuQuerySetGetType(WGPUQuerySet querySet) ;
 void wgpuQuerySetSetLabel(WGPUQuerySet querySet, WGPUStringView label) ;
 void wgpuQuerySetAddRef(WGPUQuerySet querySet) ;
 void wgpuQuerySetRelease(WGPUQuerySet querySet) ;
 void wgpuQueueCopyExternalTextureForBrowser(WGPUQueue queue, WGPUImageCopyExternalTexture const * source, WGPUTexelCopyTextureInfo const * destination, WGPUExtent3D const * copySize, WGPUCopyTextureForBrowserOptions const * options) ;
 void wgpuQueueCopyTextureForBrowser(WGPUQueue queue, WGPUTexelCopyTextureInfo const * source, WGPUTexelCopyTextureInfo const * destination, WGPUExtent3D const * copySize, WGPUCopyTextureForBrowserOptions const * options) ;
 WGPUFuture wgpuQueueOnSubmittedWorkDone(WGPUQueue queue, WGPUQueueWorkDoneCallbackInfo callbackInfo) ;
 void wgpuQueueSetLabel(WGPUQueue queue, WGPUStringView label) ;
 void wgpuQueueSubmit(WGPUQueue queue, size_t commandCount, WGPUCommandBuffer const * commands) ;
 void wgpuQueueWriteBuffer(WGPUQueue queue, WGPUBuffer buffer, uint64_t bufferOffset, void const * data, size_t size) ;
 void wgpuQueueWriteTexture(WGPUQueue queue, WGPUTexelCopyTextureInfo const * destination, void const * data, size_t dataSize, WGPUTexelCopyBufferLayout const * dataLayout, WGPUExtent3D const * writeSize) ;
 void wgpuQueueAddRef(WGPUQueue queue) ;
 void wgpuQueueRelease(WGPUQueue queue) ;
 void wgpuRenderBundleSetLabel(WGPURenderBundle renderBundle, WGPUStringView label) ;
 void wgpuRenderBundleAddRef(WGPURenderBundle renderBundle) ;
 void wgpuRenderBundleRelease(WGPURenderBundle renderBundle) ;
 void wgpuRenderBundleEncoderDraw(WGPURenderBundleEncoder renderBundleEncoder, uint32_t vertexCount, uint32_t instanceCount, uint32_t firstVertex, uint32_t firstInstance) ;
 void wgpuRenderBundleEncoderDrawIndexed(WGPURenderBundleEncoder renderBundleEncoder, uint32_t indexCount, uint32_t instanceCount, uint32_t firstIndex, int32_t baseVertex, uint32_t firstInstance) ;
 void wgpuRenderBundleEncoderDrawIndexedIndirect(WGPURenderBundleEncoder renderBundleEncoder, WGPUBuffer indirectBuffer, uint64_t indirectOffset) ;
 void wgpuRenderBundleEncoderDrawIndirect(WGPURenderBundleEncoder renderBundleEncoder, WGPUBuffer indirectBuffer, uint64_t indirectOffset) ;
 WGPURenderBundle wgpuRenderBundleEncoderFinish(WGPURenderBundleEncoder renderBundleEncoder, WGPURenderBundleDescriptor const * descriptor) ;
 void wgpuRenderBundleEncoderInsertDebugMarker(WGPURenderBundleEncoder renderBundleEncoder, WGPUStringView markerLabel) ;
 void wgpuRenderBundleEncoderPopDebugGroup(WGPURenderBundleEncoder renderBundleEncoder) ;
 void wgpuRenderBundleEncoderPushDebugGroup(WGPURenderBundleEncoder renderBundleEncoder, WGPUStringView groupLabel) ;
 void wgpuRenderBundleEncoderSetBindGroup(WGPURenderBundleEncoder renderBundleEncoder, uint32_t groupIndex, WGPUBindGroup group, size_t dynamicOffsetCount, uint32_t const * dynamicOffsets) ;
 void wgpuRenderBundleEncoderSetImmediates(WGPURenderBundleEncoder renderBundleEncoder, uint32_t offset, void const * data, size_t size) ;
 void wgpuRenderBundleEncoderSetIndexBuffer(WGPURenderBundleEncoder renderBundleEncoder, WGPUBuffer buffer, WGPUIndexFormat format, uint64_t offset, uint64_t size) ;
 void wgpuRenderBundleEncoderSetLabel(WGPURenderBundleEncoder renderBundleEncoder, WGPUStringView label) ;
 void wgpuRenderBundleEncoderSetPipeline(WGPURenderBundleEncoder renderBundleEncoder, WGPURenderPipeline pipeline) ;
 void wgpuRenderBundleEncoderSetVertexBuffer(WGPURenderBundleEncoder renderBundleEncoder, uint32_t slot, WGPUBuffer buffer, uint64_t offset, uint64_t size) ;
 void wgpuRenderBundleEncoderAddRef(WGPURenderBundleEncoder renderBundleEncoder) ;
 void wgpuRenderBundleEncoderRelease(WGPURenderBundleEncoder renderBundleEncoder) ;
 void wgpuRenderPassEncoderBeginOcclusionQuery(WGPURenderPassEncoder renderPassEncoder, uint32_t queryIndex) ;
 void wgpuRenderPassEncoderDraw(WGPURenderPassEncoder renderPassEncoder, uint32_t vertexCount, uint32_t instanceCount, uint32_t firstVertex, uint32_t firstInstance) ;
 void wgpuRenderPassEncoderDrawIndexed(WGPURenderPassEncoder renderPassEncoder, uint32_t indexCount, uint32_t instanceCount, uint32_t firstIndex, int32_t baseVertex, uint32_t firstInstance) ;
 void wgpuRenderPassEncoderDrawIndexedIndirect(WGPURenderPassEncoder renderPassEncoder, WGPUBuffer indirectBuffer, uint64_t indirectOffset) ;
 void wgpuRenderPassEncoderDrawIndirect(WGPURenderPassEncoder renderPassEncoder, WGPUBuffer indirectBuffer, uint64_t indirectOffset) ;
 void wgpuRenderPassEncoderEnd(WGPURenderPassEncoder renderPassEncoder) ;
 void wgpuRenderPassEncoderEndOcclusionQuery(WGPURenderPassEncoder renderPassEncoder) ;
 void wgpuRenderPassEncoderExecuteBundles(WGPURenderPassEncoder renderPassEncoder, size_t bundleCount, WGPURenderBundle const * bundles) ;
 void wgpuRenderPassEncoderInsertDebugMarker(WGPURenderPassEncoder renderPassEncoder, WGPUStringView markerLabel) ;
 void wgpuRenderPassEncoderMultiDrawIndexedIndirect(WGPURenderPassEncoder renderPassEncoder, WGPUBuffer indirectBuffer, uint64_t indirectOffset, uint32_t maxDrawCount, WGPUBuffer drawCountBuffer, uint64_t drawCountBufferOffset) ;
 void wgpuRenderPassEncoderMultiDrawIndirect(WGPURenderPassEncoder renderPassEncoder, WGPUBuffer indirectBuffer, uint64_t indirectOffset, uint32_t maxDrawCount, WGPUBuffer drawCountBuffer, uint64_t drawCountBufferOffset) ;
 void wgpuRenderPassEncoderPixelLocalStorageBarrier(WGPURenderPassEncoder renderPassEncoder) ;
 void wgpuRenderPassEncoderPopDebugGroup(WGPURenderPassEncoder renderPassEncoder) ;
 void wgpuRenderPassEncoderPushDebugGroup(WGPURenderPassEncoder renderPassEncoder, WGPUStringView groupLabel) ;
 void wgpuRenderPassEncoderSetBindGroup(WGPURenderPassEncoder renderPassEncoder, uint32_t groupIndex, WGPUBindGroup group, size_t dynamicOffsetCount, uint32_t const * dynamicOffsets) ;
 void wgpuRenderPassEncoderSetBlendConstant(WGPURenderPassEncoder renderPassEncoder, WGPUColor const * color) ;
 void wgpuRenderPassEncoderSetImmediates(WGPURenderPassEncoder renderPassEncoder, uint32_t offset, void const * data, size_t size) ;
 void wgpuRenderPassEncoderSetIndexBuffer(WGPURenderPassEncoder renderPassEncoder, WGPUBuffer buffer, WGPUIndexFormat format, uint64_t offset, uint64_t size) ;
 void wgpuRenderPassEncoderSetLabel(WGPURenderPassEncoder renderPassEncoder, WGPUStringView label) ;
 void wgpuRenderPassEncoderSetPipeline(WGPURenderPassEncoder renderPassEncoder, WGPURenderPipeline pipeline) ;
 void wgpuRenderPassEncoderSetScissorRect(WGPURenderPassEncoder renderPassEncoder, uint32_t x, uint32_t y, uint32_t width, uint32_t height) ;
 void wgpuRenderPassEncoderSetStencilReference(WGPURenderPassEncoder renderPassEncoder, uint32_t reference) ;
 void wgpuRenderPassEncoderSetVertexBuffer(WGPURenderPassEncoder renderPassEncoder, uint32_t slot, WGPUBuffer buffer, uint64_t offset, uint64_t size) ;
 void wgpuRenderPassEncoderSetViewport(WGPURenderPassEncoder renderPassEncoder, float x, float y, float width, float height, float minDepth, float maxDepth) ;
 void wgpuRenderPassEncoderWriteTimestamp(WGPURenderPassEncoder renderPassEncoder, WGPUQuerySet querySet, uint32_t queryIndex) ;
 void wgpuRenderPassEncoderAddRef(WGPURenderPassEncoder renderPassEncoder) ;
 void wgpuRenderPassEncoderRelease(WGPURenderPassEncoder renderPassEncoder) ;
 WGPUBindGroupLayout wgpuRenderPipelineGetBindGroupLayout(WGPURenderPipeline renderPipeline, uint32_t groupIndex) ;
 void wgpuRenderPipelineSetLabel(WGPURenderPipeline renderPipeline, WGPUStringView label) ;
 void wgpuRenderPipelineAddRef(WGPURenderPipeline renderPipeline) ;
 void wgpuRenderPipelineRelease(WGPURenderPipeline renderPipeline) ;
 void wgpuResourceTableDestroy(WGPUResourceTable resourceTable) ;
 uint32_t wgpuResourceTableGetSize(WGPUResourceTable resourceTable) ;
 uint32_t wgpuResourceTableInsertBinding(WGPUResourceTable resourceTable, WGPUBindingResource const * resource) ;
 WGPUStatus wgpuResourceTableRemoveBinding(WGPUResourceTable resourceTable, uint32_t slot) ;
 WGPUStatus wgpuResourceTableUpdate(WGPUResourceTable resourceTable, uint32_t slot, WGPUBindingResource const * resource) ;
 void wgpuResourceTableAddRef(WGPUResourceTable resourceTable) ;
 void wgpuResourceTableRelease(WGPUResourceTable resourceTable) ;
 void wgpuSamplerSetLabel(WGPUSampler sampler, WGPUStringView label) ;
 void wgpuSamplerAddRef(WGPUSampler sampler) ;
 void wgpuSamplerRelease(WGPUSampler sampler) ;
 WGPUFuture wgpuShaderModuleGetCompilationInfo(WGPUShaderModule shaderModule, WGPUCompilationInfoCallbackInfo callbackInfo) ;
 void wgpuShaderModuleSetLabel(WGPUShaderModule shaderModule, WGPUStringView label) ;
 void wgpuShaderModuleAddRef(WGPUShaderModule shaderModule) ;
 void wgpuShaderModuleRelease(WGPUShaderModule shaderModule) ;
 WGPUStatus wgpuSharedBufferMemoryBeginAccess(WGPUSharedBufferMemory sharedBufferMemory, WGPUBuffer buffer, WGPUSharedBufferMemoryBeginAccessDescriptor const * descriptor) ;
 WGPUBuffer wgpuSharedBufferMemoryCreateBuffer(WGPUSharedBufferMemory sharedBufferMemory, WGPUBufferDescriptor const * descriptor) ;
 WGPUStatus wgpuSharedBufferMemoryEndAccess(WGPUSharedBufferMemory sharedBufferMemory, WGPUBuffer buffer, WGPUSharedBufferMemoryEndAccessState * descriptor) ;
 WGPUStatus wgpuSharedBufferMemoryGetProperties(WGPUSharedBufferMemory sharedBufferMemory, WGPUSharedBufferMemoryProperties * properties) ;
 WGPUBool wgpuSharedBufferMemoryIsDeviceLost(WGPUSharedBufferMemory sharedBufferMemory) ;
 void wgpuSharedBufferMemorySetLabel(WGPUSharedBufferMemory sharedBufferMemory, WGPUStringView label) ;
 void wgpuSharedBufferMemoryAddRef(WGPUSharedBufferMemory sharedBufferMemory) ;
 void wgpuSharedBufferMemoryRelease(WGPUSharedBufferMemory sharedBufferMemory) ;
 void wgpuSharedBufferMemoryEndAccessStateFreeMembers(WGPUSharedBufferMemoryEndAccessState sharedBufferMemoryEndAccessState) ;
 void wgpuSharedFenceExportInfo(WGPUSharedFence sharedFence, WGPUSharedFenceExportInfo * info) ;
 void wgpuSharedFenceAddRef(WGPUSharedFence sharedFence) ;
 void wgpuSharedFenceRelease(WGPUSharedFence sharedFence) ;
 WGPUStatus wgpuSharedTextureMemoryBeginAccess(WGPUSharedTextureMemory sharedTextureMemory, WGPUTexture texture, WGPUSharedTextureMemoryBeginAccessDescriptor const * descriptor) ;
 WGPUTexture wgpuSharedTextureMemoryCreateTexture(WGPUSharedTextureMemory sharedTextureMemory, WGPUTextureDescriptor const * descriptor) ;
 WGPUStatus wgpuSharedTextureMemoryEndAccess(WGPUSharedTextureMemory sharedTextureMemory, WGPUTexture texture, WGPUSharedTextureMemoryEndAccessState * descriptor) ;
 WGPUStatus wgpuSharedTextureMemoryGetProperties(WGPUSharedTextureMemory sharedTextureMemory, WGPUSharedTextureMemoryProperties * properties) ;
 WGPUBool wgpuSharedTextureMemoryIsDeviceLost(WGPUSharedTextureMemory sharedTextureMemory) ;
 void wgpuSharedTextureMemorySetLabel(WGPUSharedTextureMemory sharedTextureMemory, WGPUStringView label) ;
 void wgpuSharedTextureMemoryAddRef(WGPUSharedTextureMemory sharedTextureMemory) ;
 void wgpuSharedTextureMemoryRelease(WGPUSharedTextureMemory sharedTextureMemory) ;
 void wgpuSharedTextureMemoryEndAccessStateFreeMembers(WGPUSharedTextureMemoryEndAccessState sharedTextureMemoryEndAccessState) ;
 void wgpuSupportedFeaturesFreeMembers(WGPUSupportedFeatures supportedFeatures) ;
 void wgpuSupportedInstanceFeaturesFreeMembers(WGPUSupportedInstanceFeatures supportedInstanceFeatures) ;
 void wgpuSupportedWGSLLanguageFeaturesFreeMembers(WGPUSupportedWGSLLanguageFeatures supportedWGSLLanguageFeatures) ;
 void wgpuSurfaceConfigure(WGPUSurface surface, WGPUSurfaceConfiguration const * config) ;
 WGPUStatus wgpuSurfaceGetCapabilities(WGPUSurface surface, WGPUAdapter adapter, WGPUSurfaceCapabilities * capabilities) ;
 void wgpuSurfaceGetCurrentTexture(WGPUSurface surface, WGPUSurfaceTexture * surfaceTexture) ;
 WGPUStatus wgpuSurfacePresent(WGPUSurface surface) ;
 void wgpuSurfaceSetLabel(WGPUSurface surface, WGPUStringView label) ;
 void wgpuSurfaceUnconfigure(WGPUSurface surface) ;
 void wgpuSurfaceAddRef(WGPUSurface surface) ;
 void wgpuSurfaceRelease(WGPUSurface surface) ;
 void wgpuSurfaceCapabilitiesFreeMembers(WGPUSurfaceCapabilities surfaceCapabilities) ;
 void wgpuTexelBufferViewSetLabel(WGPUTexelBufferView texelBufferView, WGPUStringView label) ;
 void wgpuTexelBufferViewAddRef(WGPUTexelBufferView texelBufferView) ;
 void wgpuTexelBufferViewRelease(WGPUTexelBufferView texelBufferView) ;
 WGPUTextureView wgpuTextureCreateErrorView(WGPUTexture texture, WGPUTextureViewDescriptor const * descriptor) ;
 WGPUTextureView wgpuTextureCreateView(WGPUTexture texture, WGPUTextureViewDescriptor const * descriptor) ;
 void wgpuTextureDestroy(WGPUTexture texture) ;
 uint32_t wgpuTextureGetDepthOrArrayLayers(WGPUTexture texture) ;
 WGPUTextureDimension wgpuTextureGetDimension(WGPUTexture texture) ;
 WGPUTextureFormat wgpuTextureGetFormat(WGPUTexture texture) ;
 uint32_t wgpuTextureGetHeight(WGPUTexture texture) ;
 uint32_t wgpuTextureGetMipLevelCount(WGPUTexture texture) ;
 uint32_t wgpuTextureGetSampleCount(WGPUTexture texture) ;
 WGPUTextureViewDimension wgpuTextureGetTextureBindingViewDimension(WGPUTexture texture) ;
 WGPUTextureUsage wgpuTextureGetUsage(WGPUTexture texture) ;
 uint32_t wgpuTextureGetWidth(WGPUTexture texture) ;
 void wgpuTexturePin(WGPUTexture texture, WGPUTextureUsage usage) ;
 void wgpuTextureSetLabel(WGPUTexture texture, WGPUStringView label) ;
 void wgpuTextureSetOwnershipForMemoryDump(WGPUTexture texture, uint64_t ownerGuid) ;
 void wgpuTextureUnpin(WGPUTexture texture) ;
 void wgpuTextureAddRef(WGPUTexture texture) ;
 void wgpuTextureRelease(WGPUTexture texture) ;
 void wgpuTextureViewSetLabel(WGPUTextureView textureView, WGPUStringView label) ;
 void wgpuTextureViewAddRef(WGPUTextureView textureView) ;
 void wgpuTextureViewRelease(WGPUTextureView textureView) ;
enum { WEBGPU_H_ = 1 };
enum { WGPU_EXPORT = 1 };
enum { WGPU_OBJECT_ATTRIBUTE = 1 };
enum { WGPU_ENUM_ATTRIBUTE = 1 };
enum { WGPU_STRUCTURE_ATTRIBUTE = 1 };
enum { WGPU_FUNCTION_ATTRIBUTE = 1 };
enum { WGPU_NULLABLE = 1 };
/* #define _wgpu_COMMA , ### define is not number */
/* #define _wgpu_ENUM_ZERO_INIT (type) (type)0 ### define is not number */
/* #define _wgpu_STRUCT_ZERO_INIT {0} ### define is not number */
/* #define _wgpu_MAKE_INIT_STRUCT (type,value) ((type) value) ### define is not number */
/* #define WGPU_TRUE (UINT32_C(1)) ### define is not number */
/* #define WGPU_FALSE (UINT32_C(0)) ### define is not number */
/* #define WGPU_ARRAY_LAYER_COUNT_UNDEFINED (UINT32_MAX) ### define is not number */
/* #define WGPU_COPY_STRIDE_UNDEFINED (UINT32_MAX) ### define is not number */
/* #define WGPU_DEPTH_CLEAR_VALUE_UNDEFINED (NAN) ### define is not number */
/* #define WGPU_DEPTH_SLICE_UNDEFINED (UINT32_MAX) ### define is not number */
/* #define WGPU_INVALID_BINDING (UINT32_MAX) ### define is not number */
/* #define WGPU_LIMIT_U32_UNDEFINED (UINT32_MAX) ### define is not number */
/* #define WGPU_LIMIT_U64_UNDEFINED (UINT64_MAX) ### define is not number */
/* #define WGPU_MIP_LEVEL_COUNT_UNDEFINED (UINT32_MAX) ### define is not number */
/* #define WGPU_QUERY_SET_INDEX_UNDEFINED (UINT32_MAX) ### define is not number */
/* #define WGPU_STRLEN (SIZE_MAX) ### define is not number */
/* #define WGPU_WHOLE_MAP_SIZE (SIZE_MAX) ### define is not number */
/* #define WGPU_WHOLE_SIZE (UINT64_MAX) ### define is not number */
/* #define WGPU_STRING_VIEW_INIT _wgpu_MAKE_INIT_STRUCT(WGPUStringView, { NULL _wgpu_COMMA WGPU_STRLEN _wgpu_COMMA }) ### define is not number */
/* #define WGPU_BUFFER_MAP_CALLBACK_INFO_INIT _wgpu_MAKE_INIT_STRUCT(WGPUBufferMapCallbackInfo, { NULL _wgpu_COMMA _wgpu_ENUM_ZERO_INIT(WGPUCallbackMode) _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_COMPILATION_INFO_CALLBACK_INFO_INIT _wgpu_MAKE_INIT_STRUCT(WGPUCompilationInfoCallbackInfo, { NULL _wgpu_COMMA _wgpu_ENUM_ZERO_INIT(WGPUCallbackMode) _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_CREATE_COMPUTE_PIPELINE_ASYNC_CALLBACK_INFO_INIT _wgpu_MAKE_INIT_STRUCT(WGPUCreateComputePipelineAsyncCallbackInfo, { NULL _wgpu_COMMA _wgpu_ENUM_ZERO_INIT(WGPUCallbackMode) _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_CREATE_RENDER_PIPELINE_ASYNC_CALLBACK_INFO_INIT _wgpu_MAKE_INIT_STRUCT(WGPUCreateRenderPipelineAsyncCallbackInfo, { NULL _wgpu_COMMA _wgpu_ENUM_ZERO_INIT(WGPUCallbackMode) _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_DEVICE_LOST_CALLBACK_INFO_INIT _wgpu_MAKE_INIT_STRUCT(WGPUDeviceLostCallbackInfo, { NULL _wgpu_COMMA _wgpu_ENUM_ZERO_INIT(WGPUCallbackMode) _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_LOGGING_CALLBACK_INFO_INIT _wgpu_MAKE_INIT_STRUCT(WGPULoggingCallbackInfo, { NULL _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_POP_ERROR_SCOPE_CALLBACK_INFO_INIT _wgpu_MAKE_INIT_STRUCT(WGPUPopErrorScopeCallbackInfo, { NULL _wgpu_COMMA _wgpu_ENUM_ZERO_INIT(WGPUCallbackMode) _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_QUEUE_WORK_DONE_CALLBACK_INFO_INIT _wgpu_MAKE_INIT_STRUCT(WGPUQueueWorkDoneCallbackInfo, { NULL _wgpu_COMMA _wgpu_ENUM_ZERO_INIT(WGPUCallbackMode) _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_REQUEST_ADAPTER_CALLBACK_INFO_INIT _wgpu_MAKE_INIT_STRUCT(WGPURequestAdapterCallbackInfo, { NULL _wgpu_COMMA _wgpu_ENUM_ZERO_INIT(WGPUCallbackMode) _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_REQUEST_DEVICE_CALLBACK_INFO_INIT _wgpu_MAKE_INIT_STRUCT(WGPURequestDeviceCallbackInfo, { NULL _wgpu_COMMA _wgpu_ENUM_ZERO_INIT(WGPUCallbackMode) _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_UNCAPTURED_ERROR_CALLBACK_INFO_INIT _wgpu_MAKE_INIT_STRUCT(WGPUUncapturedErrorCallbackInfo, { NULL _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_ADAPTER_PROPERTIES_D3D_INIT _wgpu_MAKE_INIT_STRUCT(WGPUAdapterPropertiesD3D, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_AdapterPropertiesD3D _wgpu_COMMA }) _wgpu_COMMA 0 _wgpu_COMMA }) ### define is not number */
/* #define WGPU_ADAPTER_PROPERTIES_VK_INIT _wgpu_MAKE_INIT_STRUCT(WGPUAdapterPropertiesVk, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_AdapterPropertiesVk _wgpu_COMMA }) _wgpu_COMMA 0 _wgpu_COMMA }) ### define is not number */
/* #define WGPU_ADAPTER_PROPERTIES_WGPU_INIT _wgpu_MAKE_INIT_STRUCT(WGPUAdapterPropertiesWGPU, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_AdapterPropertiesWGPU _wgpu_COMMA }) _wgpu_COMMA WGPUBackendType_Undefined _wgpu_COMMA }) ### define is not number */
/* #define WGPU_BINDING_RESOURCE_INIT _wgpu_MAKE_INIT_STRUCT(WGPUBindingResource, { NULL _wgpu_COMMA NULL _wgpu_COMMA 0 _wgpu_COMMA WGPU_WHOLE_SIZE _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_BLEND_COMPONENT_INIT _wgpu_MAKE_INIT_STRUCT(WGPUBlendComponent, { WGPUBlendOperation_Undefined _wgpu_COMMA WGPUBlendFactor_Undefined _wgpu_COMMA WGPUBlendFactor_Undefined _wgpu_COMMA }) ### define is not number */
/* #define WGPU_BUFFER_BINDING_LAYOUT_INIT _wgpu_MAKE_INIT_STRUCT(WGPUBufferBindingLayout, { NULL _wgpu_COMMA WGPUBufferBindingType_Undefined _wgpu_COMMA WGPU_FALSE _wgpu_COMMA 0 _wgpu_COMMA }) ### define is not number */
/* #define WGPU_BUFFER_HOST_MAPPED_POINTER_INIT _wgpu_MAKE_INIT_STRUCT(WGPUBufferHostMappedPointer, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_BufferHostMappedPointer _wgpu_COMMA }) _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_COLOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUColor, { 0. _wgpu_COMMA 0. _wgpu_COMMA 0. _wgpu_COMMA 0. _wgpu_COMMA }) ### define is not number */
/* #define WGPU_COLOR_TARGET_STATE_EXPAND_RESOLVE_TEXTURE_DAWN_INIT _wgpu_MAKE_INIT_STRUCT(WGPUColorTargetStateExpandResolveTextureDawn, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_ColorTargetStateExpandResolveTextureDawn _wgpu_COMMA }) _wgpu_COMMA WGPU_FALSE _wgpu_COMMA }) ### define is not number */
/* #define WGPU_COMMAND_BUFFER_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUCommandBufferDescriptor, { NULL _wgpu_COMMA WGPU_STRING_VIEW_INIT _wgpu_COMMA }) ### define is not number */
/* #define WGPU_COMPATIBILITY_MODE_LIMITS_INIT _wgpu_MAKE_INIT_STRUCT(WGPUCompatibilityModeLimits, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_CompatibilityModeLimits _wgpu_COMMA }) _wgpu_COMMA WGPU_LIMIT_U32_UNDEFINED _wgpu_COMMA WGPU_LIMIT_U32_UNDEFINED _wgpu_COMMA WGPU_LIMIT_U32_UNDEFINED _wgpu_COMMA WGPU_LIMIT_U32_UNDEFINED _wgpu_COMMA }) ### define is not number */
/* #define WGPU_CONSTANT_ENTRY_INIT _wgpu_MAKE_INIT_STRUCT(WGPUConstantEntry, { NULL _wgpu_COMMA WGPU_STRING_VIEW_INIT _wgpu_COMMA 0. _wgpu_COMMA }) ### define is not number */
/* #define WGPU_COPY_TEXTURE_FOR_BROWSER_OPTIONS_INIT _wgpu_MAKE_INIT_STRUCT(WGPUCopyTextureForBrowserOptions, { NULL _wgpu_COMMA WGPU_FALSE _wgpu_COMMA WGPU_FALSE _wgpu_COMMA WGPUAlphaMode_Unpremultiplied _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA WGPUAlphaMode_Unpremultiplied _wgpu_COMMA WGPU_FALSE _wgpu_COMMA }) ### define is not number */
/* #define WGPU_DAWN_ADAPTER_PROPERTIES_POWER_PREFERENCE_INIT _wgpu_MAKE_INIT_STRUCT(WGPUDawnAdapterPropertiesPowerPreference, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_DawnAdapterPropertiesPowerPreference _wgpu_COMMA }) _wgpu_COMMA WGPUPowerPreference_Undefined _wgpu_COMMA }) ### define is not number */
/* #define WGPU_DAWN_BUFFER_DESCRIPTOR_ERROR_INFO_FROM_WIRE_CLIENT_INIT _wgpu_MAKE_INIT_STRUCT(WGPUDawnBufferDescriptorErrorInfoFromWireClient, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_DawnBufferDescriptorErrorInfoFromWireClient _wgpu_COMMA }) _wgpu_COMMA WGPU_FALSE _wgpu_COMMA }) ### define is not number */
/* #define WGPU_DAWN_CACHE_DEVICE_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUDawnCacheDeviceDescriptor, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_DawnCacheDeviceDescriptor _wgpu_COMMA }) _wgpu_COMMA WGPU_STRING_VIEW_INIT _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA nullptr _wgpu_COMMA }) ### define is not number */
/* #define WGPU_DAWN_COMPILATION_MESSAGE_UTF16_INIT _wgpu_MAKE_INIT_STRUCT(WGPUDawnCompilationMessageUtf16, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_DawnCompilationMessageUtf16 _wgpu_COMMA }) _wgpu_COMMA 0 _wgpu_COMMA 0 _wgpu_COMMA 0 _wgpu_COMMA }) ### define is not number */
/* #define WGPU_DAWN_CONSUME_ADAPTER_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUDawnConsumeAdapterDescriptor, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_DawnConsumeAdapterDescriptor _wgpu_COMMA }) _wgpu_COMMA WGPU_FALSE _wgpu_COMMA }) ### define is not number */
/* #define WGPU_DAWN_DEVICE_ALLOCATOR_CONTROL_INIT _wgpu_MAKE_INIT_STRUCT(WGPUDawnDeviceAllocatorControl, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_DawnDeviceAllocatorControl _wgpu_COMMA }) _wgpu_COMMA 0 _wgpu_COMMA }) ### define is not number */
/* #define WGPU_DAWN_DRM_FORMAT_PROPERTIES_INIT _wgpu_MAKE_INIT_STRUCT(WGPUDawnDrmFormatProperties, { 0 _wgpu_COMMA 0 _wgpu_COMMA }) ### define is not number */
/* #define WGPU_DAWN_ENCODER_INTERNAL_USAGE_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUDawnEncoderInternalUsageDescriptor, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_DawnEncoderInternalUsageDescriptor _wgpu_COMMA }) _wgpu_COMMA WGPU_FALSE _wgpu_COMMA }) ### define is not number */
/* #define WGPU_DAWN_FAKE_BUFFER_OOM_FOR_TESTING_INIT _wgpu_MAKE_INIT_STRUCT(WGPUDawnFakeBufferOOMForTesting, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_DawnFakeBufferOOMForTesting _wgpu_COMMA }) _wgpu_COMMA WGPU_FALSE _wgpu_COMMA WGPU_FALSE _wgpu_COMMA WGPU_FALSE _wgpu_COMMA }) ### define is not number */
/* #define WGPU_DAWN_FAKE_DEVICE_INITIALIZE_ERROR_FOR_TESTING_INIT _wgpu_MAKE_INIT_STRUCT(WGPUDawnFakeDeviceInitializeErrorForTesting, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_DawnFakeDeviceInitializeErrorForTesting _wgpu_COMMA }) _wgpu_COMMA }) ### define is not number */
/* #define WGPU_DAWN_HOST_MAPPED_POINTER_LIMITS_INIT _wgpu_MAKE_INIT_STRUCT(WGPUDawnHostMappedPointerLimits, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_DawnHostMappedPointerLimits _wgpu_COMMA }) _wgpu_COMMA WGPU_LIMIT_U32_UNDEFINED _wgpu_COMMA }) ### define is not number */
/* #define WGPU_DAWN_INJECTED_INVALID_S_TYPE_INIT _wgpu_MAKE_INIT_STRUCT(WGPUDawnInjectedInvalidSType, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_DawnInjectedInvalidSType _wgpu_COMMA }) _wgpu_COMMA _wgpu_ENUM_ZERO_INIT(WGPUSType) _wgpu_COMMA }) ### define is not number */
/* #define WGPU_DAWN_RENDER_PASS_COLOR_ATTACHMENT_RENDER_TO_SINGLE_SAMPLED_INIT _wgpu_MAKE_INIT_STRUCT(WGPUDawnRenderPassColorAttachmentRenderToSingleSampled, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_DawnRenderPassColorAttachmentRenderToSingleSampled _wgpu_COMMA }) _wgpu_COMMA 1 _wgpu_COMMA }) ### define is not number */
/* #define WGPU_DAWN_SHADER_MODULE_SPIRV_OPTIONS_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUDawnShaderModuleSPIRVOptionsDescriptor, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_DawnShaderModuleSPIRVOptionsDescriptor _wgpu_COMMA }) _wgpu_COMMA WGPU_FALSE _wgpu_COMMA }) ### define is not number */
/* #define WGPU_DAWN_TEXEL_COPY_BUFFER_ROW_ALIGNMENT_LIMITS_INIT _wgpu_MAKE_INIT_STRUCT(WGPUDawnTexelCopyBufferRowAlignmentLimits, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_DawnTexelCopyBufferRowAlignmentLimits _wgpu_COMMA }) _wgpu_COMMA WGPU_LIMIT_U32_UNDEFINED _wgpu_COMMA }) ### define is not number */
/* #define WGPU_DAWN_TEXTURE_INTERNAL_USAGE_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUDawnTextureInternalUsageDescriptor, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_DawnTextureInternalUsageDescriptor _wgpu_COMMA }) _wgpu_COMMA WGPUTextureUsage_None _wgpu_COMMA }) ### define is not number */
/* #define WGPU_DAWN_TOGGLES_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUDawnTogglesDescriptor, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_DawnTogglesDescriptor _wgpu_COMMA }) _wgpu_COMMA 0 _wgpu_COMMA NULL _wgpu_COMMA 0 _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_DAWN_WGSL_BLOCKLIST_INIT _wgpu_MAKE_INIT_STRUCT(WGPUDawnWGSLBlocklist, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_DawnWGSLBlocklist _wgpu_COMMA }) _wgpu_COMMA 0 _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_DAWN_WIRE_WGSL_CONTROL_INIT _wgpu_MAKE_INIT_STRUCT(WGPUDawnWireWGSLControl, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_DawnWireWGSLControl _wgpu_COMMA }) _wgpu_COMMA WGPU_FALSE _wgpu_COMMA WGPU_FALSE _wgpu_COMMA WGPU_FALSE _wgpu_COMMA }) ### define is not number */
/* #define WGPU_EMSCRIPTEN_SURFACE_SOURCE_CANVAS_HTML_SELECTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUEmscriptenSurfaceSourceCanvasHTMLSelector, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_EmscriptenSurfaceSourceCanvasHTMLSelector _wgpu_COMMA }) _wgpu_COMMA WGPU_STRING_VIEW_INIT _wgpu_COMMA }) ### define is not number */
/* #define WGPU_EXTENT_2D_INIT _wgpu_MAKE_INIT_STRUCT(WGPUExtent2D, { 0 _wgpu_COMMA 0 _wgpu_COMMA }) ### define is not number */
/* #define WGPU_EXTENT_3D_INIT _wgpu_MAKE_INIT_STRUCT(WGPUExtent3D, { 0 _wgpu_COMMA 1 _wgpu_COMMA 1 _wgpu_COMMA }) ### define is not number */
/* #define WGPU_EXTERNAL_TEXTURE_BINDING_ENTRY_INIT _wgpu_MAKE_INIT_STRUCT(WGPUExternalTextureBindingEntry, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_ExternalTextureBindingEntry _wgpu_COMMA }) _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_EXTERNAL_TEXTURE_BINDING_LAYOUT_INIT _wgpu_MAKE_INIT_STRUCT(WGPUExternalTextureBindingLayout, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_ExternalTextureBindingLayout _wgpu_COMMA }) _wgpu_COMMA }) ### define is not number */
/* #define WGPU_FUTURE_INIT _wgpu_MAKE_INIT_STRUCT(WGPUFuture, { 0 _wgpu_COMMA }) ### define is not number */
/* #define WGPU_INSTANCE_LIMITS_INIT _wgpu_MAKE_INIT_STRUCT(WGPUInstanceLimits, { NULL _wgpu_COMMA 0 _wgpu_COMMA }) ### define is not number */
/* #define WGPU_INTERNAL_HAVE_EMDAWNWEBGPU_HEADER_INIT _wgpu_MAKE_INIT_STRUCT(WGPUINTERNAL_HAVE_EMDAWNWEBGPU_HEADER, { WGPU_FALSE _wgpu_COMMA }) ### define is not number */
/* #define WGPU_MEMORY_HEAP_INFO_INIT _wgpu_MAKE_INIT_STRUCT(WGPUMemoryHeapInfo, { WGPUHeapProperty_None _wgpu_COMMA 0 _wgpu_COMMA }) ### define is not number */
/* #define WGPU_MULTISAMPLE_STATE_INIT _wgpu_MAKE_INIT_STRUCT(WGPUMultisampleState, { NULL _wgpu_COMMA 1 _wgpu_COMMA 0xFFFFFFFF _wgpu_COMMA WGPU_FALSE _wgpu_COMMA }) ### define is not number */
/* #define WGPU_ORIGIN_2D_INIT _wgpu_MAKE_INIT_STRUCT(WGPUOrigin2D, { 0 _wgpu_COMMA 0 _wgpu_COMMA }) ### define is not number */
/* #define WGPU_ORIGIN_3D_INIT _wgpu_MAKE_INIT_STRUCT(WGPUOrigin3D, { 0 _wgpu_COMMA 0 _wgpu_COMMA 0 _wgpu_COMMA }) ### define is not number */
/* #define WGPU_PASS_TIMESTAMP_WRITES_INIT _wgpu_MAKE_INIT_STRUCT(WGPUPassTimestampWrites, { NULL _wgpu_COMMA NULL _wgpu_COMMA WGPU_QUERY_SET_INDEX_UNDEFINED _wgpu_COMMA WGPU_QUERY_SET_INDEX_UNDEFINED _wgpu_COMMA }) ### define is not number */
/* #define WGPU_PIPELINE_LAYOUT_RESOURCE_TABLE_INIT _wgpu_MAKE_INIT_STRUCT(WGPUPipelineLayoutResourceTable, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_PipelineLayoutResourceTable _wgpu_COMMA }) _wgpu_COMMA WGPU_FALSE _wgpu_COMMA }) ### define is not number */
/* #define WGPU_PIPELINE_LAYOUT_STORAGE_ATTACHMENT_INIT _wgpu_MAKE_INIT_STRUCT(WGPUPipelineLayoutStorageAttachment, { NULL _wgpu_COMMA 0 _wgpu_COMMA WGPUTextureFormat_Undefined _wgpu_COMMA }) ### define is not number */
/* #define WGPU_PRIMITIVE_STATE_INIT _wgpu_MAKE_INIT_STRUCT(WGPUPrimitiveState, { NULL _wgpu_COMMA WGPUPrimitiveTopology_Undefined _wgpu_COMMA WGPUIndexFormat_Undefined _wgpu_COMMA WGPUFrontFace_Undefined _wgpu_COMMA WGPUCullMode_Undefined _wgpu_COMMA WGPU_FALSE _wgpu_COMMA }) ### define is not number */
/* #define WGPU_QUERY_SET_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUQuerySetDescriptor, { NULL _wgpu_COMMA WGPU_STRING_VIEW_INIT _wgpu_COMMA _wgpu_ENUM_ZERO_INIT(WGPUQueryType) _wgpu_COMMA 0 _wgpu_COMMA }) ### define is not number */
/* #define WGPU_QUEUE_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUQueueDescriptor, { NULL _wgpu_COMMA WGPU_STRING_VIEW_INIT _wgpu_COMMA }) ### define is not number */
/* #define WGPU_RENDER_BUNDLE_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPURenderBundleDescriptor, { NULL _wgpu_COMMA WGPU_STRING_VIEW_INIT _wgpu_COMMA }) ### define is not number */
/* #define WGPU_RENDER_BUNDLE_ENCODER_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPURenderBundleEncoderDescriptor, { NULL _wgpu_COMMA WGPU_STRING_VIEW_INIT _wgpu_COMMA 0 _wgpu_COMMA NULL _wgpu_COMMA WGPUTextureFormat_Undefined _wgpu_COMMA 1 _wgpu_COMMA WGPU_FALSE _wgpu_COMMA WGPU_FALSE _wgpu_COMMA }) ### define is not number */
/* #define WGPU_RENDER_PASS_DEPTH_STENCIL_ATTACHMENT_INIT _wgpu_MAKE_INIT_STRUCT(WGPURenderPassDepthStencilAttachment, { NULL _wgpu_COMMA NULL _wgpu_COMMA WGPULoadOp_Undefined _wgpu_COMMA WGPUStoreOp_Undefined _wgpu_COMMA WGPU_DEPTH_CLEAR_VALUE_UNDEFINED _wgpu_COMMA WGPU_FALSE _wgpu_COMMA WGPULoadOp_Undefined _wgpu_COMMA WGPUStoreOp_Undefined _wgpu_COMMA 0 _wgpu_COMMA WGPU_FALSE _wgpu_COMMA }) ### define is not number */
/* #define WGPU_RENDER_PASS_DESCRIPTOR_EXPAND_RESOLVE_RECT_INIT _wgpu_MAKE_INIT_STRUCT(WGPURenderPassDescriptorExpandResolveRect, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_RenderPassDescriptorExpandResolveRect _wgpu_COMMA }) _wgpu_COMMA 0 _wgpu_COMMA 0 _wgpu_COMMA 0 _wgpu_COMMA 0 _wgpu_COMMA }) ### define is not number */
/* #define WGPU_RENDER_PASS_DESCRIPTOR_RESOLVE_RECT_INIT _wgpu_MAKE_INIT_STRUCT(WGPURenderPassDescriptorResolveRect, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_RenderPassDescriptorResolveRect _wgpu_COMMA }) _wgpu_COMMA 0 _wgpu_COMMA 0 _wgpu_COMMA 0 _wgpu_COMMA 0 _wgpu_COMMA 0 _wgpu_COMMA 0 _wgpu_COMMA }) ### define is not number */
/* #define WGPU_RENDER_PASS_MAX_DRAW_COUNT_INIT _wgpu_MAKE_INIT_STRUCT(WGPURenderPassMaxDrawCount, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_RenderPassMaxDrawCount _wgpu_COMMA }) _wgpu_COMMA 50000000 _wgpu_COMMA }) ### define is not number */
/* #define WGPU_REQUEST_ADAPTER_WEBGPU_BACKEND_OPTIONS_INIT _wgpu_MAKE_INIT_STRUCT(WGPURequestAdapterWebGPUBackendOptions, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_RequestAdapterWebGPUBackendOptions _wgpu_COMMA }) _wgpu_COMMA }) ### define is not number */
/* #define WGPU_REQUEST_ADAPTER_WEBXR_OPTIONS_INIT _wgpu_MAKE_INIT_STRUCT(WGPURequestAdapterWebXROptions, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_RequestAdapterWebXROptions _wgpu_COMMA }) _wgpu_COMMA WGPU_FALSE _wgpu_COMMA }) ### define is not number */
/* #define WGPU_RESOURCE_TABLE_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUResourceTableDescriptor, { NULL _wgpu_COMMA WGPU_STRING_VIEW_INIT _wgpu_COMMA 0 _wgpu_COMMA }) ### define is not number */
/* #define WGPU_RESOURCE_TABLE_LIMITS_INIT _wgpu_MAKE_INIT_STRUCT(WGPUResourceTableLimits, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_ResourceTableLimits _wgpu_COMMA }) _wgpu_COMMA WGPU_LIMIT_U32_UNDEFINED _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SAMPLER_BINDING_LAYOUT_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSamplerBindingLayout, { NULL _wgpu_COMMA WGPUSamplerBindingType_Undefined _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SHADER_MODULE_COMPILATION_OPTIONS_INIT _wgpu_MAKE_INIT_STRUCT(WGPUShaderModuleCompilationOptions, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_ShaderModuleCompilationOptions _wgpu_COMMA }) _wgpu_COMMA WGPU_FALSE _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SHADER_SOURCE_SPIRV_INIT _wgpu_MAKE_INIT_STRUCT(WGPUShaderSourceSPIRV, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_ShaderSourceSPIRV _wgpu_COMMA }) _wgpu_COMMA 0 _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SHADER_SOURCE_WGSL_INIT _wgpu_MAKE_INIT_STRUCT(WGPUShaderSourceWGSL, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_ShaderSourceWGSL _wgpu_COMMA }) _wgpu_COMMA WGPU_STRING_VIEW_INIT _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SHARED_BUFFER_MEMORY_BEGIN_ACCESS_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSharedBufferMemoryBeginAccessDescriptor, { NULL _wgpu_COMMA WGPU_FALSE _wgpu_COMMA 0 _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SHARED_BUFFER_MEMORY_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSharedBufferMemoryDescriptor, { NULL _wgpu_COMMA WGPU_STRING_VIEW_INIT _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SHARED_BUFFER_MEMORY_END_ACCESS_STATE_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSharedBufferMemoryEndAccessState, { NULL _wgpu_COMMA WGPU_FALSE _wgpu_COMMA 0 _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SHARED_BUFFER_MEMORY_PROPERTIES_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSharedBufferMemoryProperties, { NULL _wgpu_COMMA WGPUBufferUsage_None _wgpu_COMMA 0 _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SHARED_FENCE_DXGI_SHARED_HANDLE_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSharedFenceDXGISharedHandleDescriptor, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_SharedFenceDXGISharedHandleDescriptor _wgpu_COMMA }) _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SHARED_FENCE_DXGI_SHARED_HANDLE_EXPORT_INFO_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSharedFenceDXGISharedHandleExportInfo, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_SharedFenceDXGISharedHandleExportInfo _wgpu_COMMA }) _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SHARED_FENCE_EGL_SYNC_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSharedFenceEGLSyncDescriptor, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_SharedFenceEGLSyncDescriptor _wgpu_COMMA }) _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SHARED_FENCE_EGL_SYNC_EXPORT_INFO_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSharedFenceEGLSyncExportInfo, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_SharedFenceEGLSyncExportInfo _wgpu_COMMA }) _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SHARED_FENCE_MTL_SHARED_EVENT_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSharedFenceMTLSharedEventDescriptor, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_SharedFenceMTLSharedEventDescriptor _wgpu_COMMA }) _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SHARED_FENCE_MTL_SHARED_EVENT_EXPORT_INFO_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSharedFenceMTLSharedEventExportInfo, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_SharedFenceMTLSharedEventExportInfo _wgpu_COMMA }) _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SHARED_FENCE_SYNC_FD_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSharedFenceSyncFDDescriptor, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_SharedFenceSyncFDDescriptor _wgpu_COMMA }) _wgpu_COMMA 0 _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SHARED_FENCE_SYNC_FD_EXPORT_INFO_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSharedFenceSyncFDExportInfo, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_SharedFenceSyncFDExportInfo _wgpu_COMMA }) _wgpu_COMMA 0 _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SHARED_FENCE_VK_SEMAPHORE_OPAQUE_FD_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSharedFenceVkSemaphoreOpaqueFDDescriptor, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_SharedFenceVkSemaphoreOpaqueFDDescriptor _wgpu_COMMA }) _wgpu_COMMA 0 _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SHARED_FENCE_VK_SEMAPHORE_OPAQUE_FD_EXPORT_INFO_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSharedFenceVkSemaphoreOpaqueFDExportInfo, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_SharedFenceVkSemaphoreOpaqueFDExportInfo _wgpu_COMMA }) _wgpu_COMMA 0 _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SHARED_FENCE_VK_SEMAPHORE_ZIRCON_HANDLE_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSharedFenceVkSemaphoreZirconHandleDescriptor, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_SharedFenceVkSemaphoreZirconHandleDescriptor _wgpu_COMMA }) _wgpu_COMMA 0 _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SHARED_FENCE_VK_SEMAPHORE_ZIRCON_HANDLE_EXPORT_INFO_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSharedFenceVkSemaphoreZirconHandleExportInfo, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_SharedFenceVkSemaphoreZirconHandleExportInfo _wgpu_COMMA }) _wgpu_COMMA 0 _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SHARED_TEXTURE_MEMORY_A_HARDWARE_BUFFER_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSharedTextureMemoryAHardwareBufferDescriptor, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_SharedTextureMemoryAHardwareBufferDescriptor _wgpu_COMMA }) _wgpu_COMMA NULL _wgpu_COMMA WGPU_FALSE _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SHARED_TEXTURE_MEMORY_D3D11_BEGIN_STATE_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSharedTextureMemoryD3D11BeginState, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_SharedTextureMemoryD3D11BeginState _wgpu_COMMA }) _wgpu_COMMA WGPU_TRUE _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SHARED_TEXTURE_MEMORY_D3D_SWAPCHAIN_BEGIN_STATE_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSharedTextureMemoryD3DSwapchainBeginState, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_SharedTextureMemoryD3DSwapchainBeginState _wgpu_COMMA }) _wgpu_COMMA WGPU_FALSE _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SHARED_TEXTURE_MEMORY_DMA_BUF_PLANE_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSharedTextureMemoryDmaBufPlane, { 0 _wgpu_COMMA 0 _wgpu_COMMA 0 _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SHARED_TEXTURE_MEMORY_DXGI_SHARED_HANDLE_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSharedTextureMemoryDXGISharedHandleDescriptor, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_SharedTextureMemoryDXGISharedHandleDescriptor _wgpu_COMMA }) _wgpu_COMMA NULL _wgpu_COMMA WGPU_FALSE _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SHARED_TEXTURE_MEMORY_EGL_IMAGE_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSharedTextureMemoryEGLImageDescriptor, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_SharedTextureMemoryEGLImageDescriptor _wgpu_COMMA }) _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SHARED_TEXTURE_MEMORY_IO_SURFACE_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSharedTextureMemoryIOSurfaceDescriptor, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_SharedTextureMemoryIOSurfaceDescriptor _wgpu_COMMA }) _wgpu_COMMA NULL _wgpu_COMMA WGPU_TRUE _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SHARED_TEXTURE_MEMORY_OPAQUE_FD_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSharedTextureMemoryOpaqueFDDescriptor, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_SharedTextureMemoryOpaqueFDDescriptor _wgpu_COMMA }) _wgpu_COMMA NULL _wgpu_COMMA 0 _wgpu_COMMA 0 _wgpu_COMMA 0 _wgpu_COMMA WGPU_FALSE _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SHARED_TEXTURE_MEMORY_VK_DEDICATED_ALLOCATION_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSharedTextureMemoryVkDedicatedAllocationDescriptor, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_SharedTextureMemoryVkDedicatedAllocationDescriptor _wgpu_COMMA }) _wgpu_COMMA WGPU_FALSE _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SHARED_TEXTURE_MEMORY_VK_IMAGE_LAYOUT_BEGIN_STATE_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSharedTextureMemoryVkImageLayoutBeginState, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_SharedTextureMemoryVkImageLayoutBeginState _wgpu_COMMA }) _wgpu_COMMA 0 _wgpu_COMMA 0 _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SHARED_TEXTURE_MEMORY_VK_IMAGE_LAYOUT_END_STATE_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSharedTextureMemoryVkImageLayoutEndState, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_SharedTextureMemoryVkImageLayoutEndState _wgpu_COMMA }) _wgpu_COMMA 0 _wgpu_COMMA 0 _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SHARED_TEXTURE_MEMORY_ZIRCON_HANDLE_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSharedTextureMemoryZirconHandleDescriptor, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_SharedTextureMemoryZirconHandleDescriptor _wgpu_COMMA }) _wgpu_COMMA 0 _wgpu_COMMA 0 _wgpu_COMMA }) ### define is not number */
/* #define WGPU_STATIC_SAMPLER_BINDING_LAYOUT_INIT _wgpu_MAKE_INIT_STRUCT(WGPUStaticSamplerBindingLayout, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_StaticSamplerBindingLayout _wgpu_COMMA }) _wgpu_COMMA NULL _wgpu_COMMA WGPU_LIMIT_U32_UNDEFINED _wgpu_COMMA }) ### define is not number */
/* #define WGPU_STENCIL_FACE_STATE_INIT _wgpu_MAKE_INIT_STRUCT(WGPUStencilFaceState, { WGPUCompareFunction_Undefined _wgpu_COMMA WGPUStencilOperation_Undefined _wgpu_COMMA WGPUStencilOperation_Undefined _wgpu_COMMA WGPUStencilOperation_Undefined _wgpu_COMMA }) ### define is not number */
/* #define WGPU_STORAGE_TEXTURE_BINDING_LAYOUT_INIT _wgpu_MAKE_INIT_STRUCT(WGPUStorageTextureBindingLayout, { NULL _wgpu_COMMA WGPUStorageTextureAccess_Undefined _wgpu_COMMA WGPUTextureFormat_Undefined _wgpu_COMMA WGPUTextureViewDimension_Undefined _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SUBGROUP_MATRIX_CONFIG_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSubgroupMatrixConfig, { _wgpu_ENUM_ZERO_INIT(WGPUSubgroupMatrixComponentType) _wgpu_COMMA _wgpu_ENUM_ZERO_INIT(WGPUSubgroupMatrixComponentType) _wgpu_COMMA 0 _wgpu_COMMA 0 _wgpu_COMMA 0 _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SUPPORTED_FEATURES_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSupportedFeatures, { 0 _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SUPPORTED_INSTANCE_FEATURES_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSupportedInstanceFeatures, { 0 _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SUPPORTED_WGSL_LANGUAGE_FEATURES_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSupportedWGSLLanguageFeatures, { 0 _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SURFACE_CAPABILITIES_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSurfaceCapabilities, { NULL _wgpu_COMMA WGPUTextureUsage_None _wgpu_COMMA 0 _wgpu_COMMA NULL _wgpu_COMMA 0 _wgpu_COMMA NULL _wgpu_COMMA 0 _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SURFACE_COLOR_MANAGEMENT_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSurfaceColorManagement, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_SurfaceColorManagement _wgpu_COMMA }) _wgpu_COMMA _wgpu_ENUM_ZERO_INIT(WGPUPredefinedColorSpace) _wgpu_COMMA _wgpu_ENUM_ZERO_INIT(WGPUToneMappingMode) _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SURFACE_CONFIGURATION_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSurfaceConfiguration, { NULL _wgpu_COMMA NULL _wgpu_COMMA WGPUTextureFormat_Undefined _wgpu_COMMA WGPUTextureUsage_RenderAttachment _wgpu_COMMA 0 _wgpu_COMMA 0 _wgpu_COMMA 0 _wgpu_COMMA NULL _wgpu_COMMA WGPUCompositeAlphaMode_Auto _wgpu_COMMA WGPUPresentMode_Undefined _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SURFACE_DESCRIPTOR_FROM_WINDOWS_CORE_WINDOW_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSurfaceDescriptorFromWindowsCoreWindow, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_SurfaceDescriptorFromWindowsCoreWindow _wgpu_COMMA }) _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SURFACE_DESCRIPTOR_FROM_WINDOWS_UWP_SWAP_CHAIN_PANEL_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSurfaceDescriptorFromWindowsUWPSwapChainPanel, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_SurfaceDescriptorFromWindowsUWPSwapChainPanel _wgpu_COMMA }) _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SURFACE_DESCRIPTOR_FROM_WINDOWS_WINUI_SWAP_CHAIN_PANEL_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSurfaceDescriptorFromWindowsWinUISwapChainPanel, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_SurfaceDescriptorFromWindowsWinUISwapChainPanel _wgpu_COMMA }) _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SURFACE_SOURCE_ANDROID_NATIVE_WINDOW_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSurfaceSourceAndroidNativeWindow, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_SurfaceSourceAndroidNativeWindow _wgpu_COMMA }) _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SURFACE_SOURCE_METAL_LAYER_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSurfaceSourceMetalLayer, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_SurfaceSourceMetalLayer _wgpu_COMMA }) _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SURFACE_SOURCE_WAYLAND_SURFACE_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSurfaceSourceWaylandSurface, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_SurfaceSourceWaylandSurface _wgpu_COMMA }) _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SURFACE_SOURCE_WINDOWS_HWND_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSurfaceSourceWindowsHWND, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_SurfaceSourceWindowsHWND _wgpu_COMMA }) _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SURFACE_SOURCE_XCB_WINDOW_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSurfaceSourceXCBWindow, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_SurfaceSourceXCBWindow _wgpu_COMMA }) _wgpu_COMMA NULL _wgpu_COMMA 0 _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SURFACE_SOURCE_XLIB_WINDOW_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSurfaceSourceXlibWindow, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_SurfaceSourceXlibWindow _wgpu_COMMA }) _wgpu_COMMA NULL _wgpu_COMMA 0 _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SURFACE_TEXTURE_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSurfaceTexture, { NULL _wgpu_COMMA NULL _wgpu_COMMA _wgpu_ENUM_ZERO_INIT(WGPUSurfaceGetCurrentTextureStatus) _wgpu_COMMA }) ### define is not number */
/* #define WGPU_TEXEL_BUFFER_BINDING_ENTRY_INIT _wgpu_MAKE_INIT_STRUCT(WGPUTexelBufferBindingEntry, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_TexelBufferBindingEntry _wgpu_COMMA }) _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_TEXEL_BUFFER_BINDING_LAYOUT_INIT _wgpu_MAKE_INIT_STRUCT(WGPUTexelBufferBindingLayout, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_TexelBufferBindingLayout _wgpu_COMMA }) _wgpu_COMMA WGPUTexelBufferAccess_Undefined _wgpu_COMMA WGPUTextureFormat_Undefined _wgpu_COMMA }) ### define is not number */
/* #define WGPU_TEXEL_BUFFER_VIEW_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUTexelBufferViewDescriptor, { NULL _wgpu_COMMA WGPU_STRING_VIEW_INIT _wgpu_COMMA WGPUTextureFormat_Undefined _wgpu_COMMA 0 _wgpu_COMMA WGPU_WHOLE_SIZE _wgpu_COMMA }) ### define is not number */
/* #define WGPU_TEXEL_COPY_BUFFER_LAYOUT_INIT _wgpu_MAKE_INIT_STRUCT(WGPUTexelCopyBufferLayout, { 0 _wgpu_COMMA WGPU_COPY_STRIDE_UNDEFINED _wgpu_COMMA WGPU_COPY_STRIDE_UNDEFINED _wgpu_COMMA }) ### define is not number */
/* #define WGPU_TEXTURE_BINDING_LAYOUT_INIT _wgpu_MAKE_INIT_STRUCT(WGPUTextureBindingLayout, { NULL _wgpu_COMMA WGPUTextureSampleType_Undefined _wgpu_COMMA WGPUTextureViewDimension_Undefined _wgpu_COMMA WGPU_FALSE _wgpu_COMMA }) ### define is not number */
/* #define WGPU_TEXTURE_BINDING_VIEW_DIMENSION_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUTextureBindingViewDimensionDescriptor, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_TextureBindingViewDimensionDescriptor _wgpu_COMMA }) _wgpu_COMMA WGPUTextureViewDimension_Undefined _wgpu_COMMA }) ### define is not number */
/* #define WGPU_TEXTURE_COMPONENT_SWIZZLE_INIT _wgpu_MAKE_INIT_STRUCT(WGPUTextureComponentSwizzle, { WGPUComponentSwizzle_Undefined _wgpu_COMMA WGPUComponentSwizzle_Undefined _wgpu_COMMA WGPUComponentSwizzle_Undefined _wgpu_COMMA WGPUComponentSwizzle_Undefined _wgpu_COMMA }) ### define is not number */
/* #define WGPU_VERTEX_ATTRIBUTE_INIT _wgpu_MAKE_INIT_STRUCT(WGPUVertexAttribute, { NULL _wgpu_COMMA _wgpu_ENUM_ZERO_INIT(WGPUVertexFormat) _wgpu_COMMA 0 _wgpu_COMMA 0 _wgpu_COMMA }) ### define is not number */
/* #define WGPU_Y_CB_CR_VK_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUYCbCrVkDescriptor, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_YCbCrVkDescriptor _wgpu_COMMA }) _wgpu_COMMA 0 _wgpu_COMMA 0 _wgpu_COMMA 0 _wgpu_COMMA 0 _wgpu_COMMA 0 _wgpu_COMMA 0 _wgpu_COMMA 0 _wgpu_COMMA 0 _wgpu_COMMA 0 _wgpu_COMMA WGPUFilterMode_Undefined _wgpu_COMMA WGPU_FALSE _wgpu_COMMA 0 _wgpu_COMMA }) ### define is not number */
/* #define WGPU_ADAPTER_PROPERTIES_MEMORY_HEAPS_INIT _wgpu_MAKE_INIT_STRUCT(WGPUAdapterPropertiesMemoryHeaps, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_AdapterPropertiesMemoryHeaps _wgpu_COMMA }) _wgpu_COMMA 0 _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_ADAPTER_PROPERTIES_SUBGROUP_MATRIX_CONFIGS_INIT _wgpu_MAKE_INIT_STRUCT(WGPUAdapterPropertiesSubgroupMatrixConfigs, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_AdapterPropertiesSubgroupMatrixConfigs _wgpu_COMMA }) _wgpu_COMMA 0 _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_A_HARDWARE_BUFFER_PROPERTIES_INIT _wgpu_MAKE_INIT_STRUCT(WGPUAHardwareBufferProperties, { WGPU_Y_CB_CR_VK_DESCRIPTOR_INIT _wgpu_COMMA }) ### define is not number */
/* #define WGPU_BIND_GROUP_ENTRY_INIT _wgpu_MAKE_INIT_STRUCT(WGPUBindGroupEntry, { NULL _wgpu_COMMA 0 _wgpu_COMMA NULL _wgpu_COMMA 0 _wgpu_COMMA WGPU_WHOLE_SIZE _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_BIND_GROUP_LAYOUT_ENTRY_INIT _wgpu_MAKE_INIT_STRUCT(WGPUBindGroupLayoutEntry, { NULL _wgpu_COMMA 0 _wgpu_COMMA WGPUShaderStage_None _wgpu_COMMA 0 _wgpu_COMMA _wgpu_STRUCT_ZERO_INIT _wgpu_COMMA _wgpu_STRUCT_ZERO_INIT _wgpu_COMMA _wgpu_STRUCT_ZERO_INIT _wgpu_COMMA _wgpu_STRUCT_ZERO_INIT _wgpu_COMMA }) ### define is not number */
/* #define WGPU_BLEND_STATE_INIT _wgpu_MAKE_INIT_STRUCT(WGPUBlendState, { WGPU_BLEND_COMPONENT_INIT _wgpu_COMMA WGPU_BLEND_COMPONENT_INIT _wgpu_COMMA }) ### define is not number */
/* #define WGPU_BUFFER_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUBufferDescriptor, { NULL _wgpu_COMMA WGPU_STRING_VIEW_INIT _wgpu_COMMA WGPUBufferUsage_None _wgpu_COMMA 0 _wgpu_COMMA WGPU_FALSE _wgpu_COMMA }) ### define is not number */
/* #define WGPU_COMMAND_ENCODER_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUCommandEncoderDescriptor, { NULL _wgpu_COMMA WGPU_STRING_VIEW_INIT _wgpu_COMMA }) ### define is not number */
/* #define WGPU_COMPILATION_MESSAGE_INIT _wgpu_MAKE_INIT_STRUCT(WGPUCompilationMessage, { NULL _wgpu_COMMA WGPU_STRING_VIEW_INIT _wgpu_COMMA _wgpu_ENUM_ZERO_INIT(WGPUCompilationMessageType) _wgpu_COMMA 0 _wgpu_COMMA 0 _wgpu_COMMA 0 _wgpu_COMMA 0 _wgpu_COMMA }) ### define is not number */
/* #define WGPU_COMPUTE_PASS_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUComputePassDescriptor, { NULL _wgpu_COMMA WGPU_STRING_VIEW_INIT _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_COMPUTE_STATE_INIT _wgpu_MAKE_INIT_STRUCT(WGPUComputeState, { NULL _wgpu_COMMA NULL _wgpu_COMMA WGPU_STRING_VIEW_INIT _wgpu_COMMA 0 _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_DAWN_DRM_FORMAT_CAPABILITIES_INIT _wgpu_MAKE_INIT_STRUCT(WGPUDawnDrmFormatCapabilities, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_DawnDrmFormatCapabilities _wgpu_COMMA }) _wgpu_COMMA 0 _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_DEPTH_STENCIL_STATE_INIT _wgpu_MAKE_INIT_STRUCT(WGPUDepthStencilState, { NULL _wgpu_COMMA WGPUTextureFormat_Undefined _wgpu_COMMA WGPUOptionalBool_Undefined _wgpu_COMMA WGPUCompareFunction_Undefined _wgpu_COMMA WGPU_STENCIL_FACE_STATE_INIT _wgpu_COMMA WGPU_STENCIL_FACE_STATE_INIT _wgpu_COMMA 0xFFFFFFFF _wgpu_COMMA 0xFFFFFFFF _wgpu_COMMA 0 _wgpu_COMMA 0.f _wgpu_COMMA 0.f _wgpu_COMMA }) ### define is not number */
/* #define WGPU_EXTERNAL_TEXTURE_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUExternalTextureDescriptor, { NULL _wgpu_COMMA WGPU_STRING_VIEW_INIT _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA WGPU_ORIGIN_2D_INIT _wgpu_COMMA WGPU_EXTENT_2D_INIT _wgpu_COMMA WGPU_EXTENT_2D_INIT _wgpu_COMMA WGPU_FALSE _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA WGPU_FALSE _wgpu_COMMA WGPUExternalTextureRotation_Rotate0Degrees _wgpu_COMMA }) ### define is not number */
/* #define WGPU_FUTURE_WAIT_INFO_INIT _wgpu_MAKE_INIT_STRUCT(WGPUFutureWaitInfo, { WGPU_FUTURE_INIT _wgpu_COMMA WGPU_FALSE _wgpu_COMMA }) ### define is not number */
/* #define WGPU_IMAGE_COPY_EXTERNAL_TEXTURE_INIT _wgpu_MAKE_INIT_STRUCT(WGPUImageCopyExternalTexture, { NULL _wgpu_COMMA NULL _wgpu_COMMA WGPU_ORIGIN_3D_INIT _wgpu_COMMA WGPU_EXTENT_2D_INIT _wgpu_COMMA }) ### define is not number */
/* #define WGPU_INSTANCE_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUInstanceDescriptor, { NULL _wgpu_COMMA 0 _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_LIMITS_INIT _wgpu_MAKE_INIT_STRUCT(WGPULimits, { NULL _wgpu_COMMA WGPU_LIMIT_U32_UNDEFINED _wgpu_COMMA WGPU_LIMIT_U32_UNDEFINED _wgpu_COMMA WGPU_LIMIT_U32_UNDEFINED _wgpu_COMMA WGPU_LIMIT_U32_UNDEFINED _wgpu_COMMA WGPU_LIMIT_U32_UNDEFINED _wgpu_COMMA WGPU_LIMIT_U32_UNDEFINED _wgpu_COMMA WGPU_LIMIT_U32_UNDEFINED _wgpu_COMMA WGPU_LIMIT_U32_UNDEFINED _wgpu_COMMA WGPU_LIMIT_U32_UNDEFINED _wgpu_COMMA WGPU_LIMIT_U32_UNDEFINED _wgpu_COMMA WGPU_LIMIT_U32_UNDEFINED _wgpu_COMMA WGPU_LIMIT_U32_UNDEFINED _wgpu_COMMA WGPU_LIMIT_U32_UNDEFINED _wgpu_COMMA WGPU_LIMIT_U32_UNDEFINED _wgpu_COMMA WGPU_LIMIT_U64_UNDEFINED _wgpu_COMMA WGPU_LIMIT_U64_UNDEFINED _wgpu_COMMA WGPU_LIMIT_U32_UNDEFINED _wgpu_COMMA WGPU_LIMIT_U32_UNDEFINED _wgpu_COMMA WGPU_LIMIT_U32_UNDEFINED _wgpu_COMMA WGPU_LIMIT_U64_UNDEFINED _wgpu_COMMA WGPU_LIMIT_U32_UNDEFINED _wgpu_COMMA WGPU_LIMIT_U32_UNDEFINED _wgpu_COMMA WGPU_LIMIT_U32_UNDEFINED _wgpu_COMMA WGPU_LIMIT_U32_UNDEFINED _wgpu_COMMA WGPU_LIMIT_U32_UNDEFINED _wgpu_COMMA WGPU_LIMIT_U32_UNDEFINED _wgpu_COMMA WGPU_LIMIT_U32_UNDEFINED _wgpu_COMMA WGPU_LIMIT_U32_UNDEFINED _wgpu_COMMA WGPU_LIMIT_U32_UNDEFINED _wgpu_COMMA WGPU_LIMIT_U32_UNDEFINED _wgpu_COMMA WGPU_LIMIT_U32_UNDEFINED _wgpu_COMMA WGPU_LIMIT_U32_UNDEFINED _wgpu_COMMA }) ### define is not number */
/* #define WGPU_PIPELINE_LAYOUT_PIXEL_LOCAL_STORAGE_INIT _wgpu_MAKE_INIT_STRUCT(WGPUPipelineLayoutPixelLocalStorage, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_PipelineLayoutPixelLocalStorage _wgpu_COMMA }) _wgpu_COMMA 0 _wgpu_COMMA 0 _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_RENDER_PASS_COLOR_ATTACHMENT_INIT _wgpu_MAKE_INIT_STRUCT(WGPURenderPassColorAttachment, { NULL _wgpu_COMMA NULL _wgpu_COMMA WGPU_DEPTH_SLICE_UNDEFINED _wgpu_COMMA NULL _wgpu_COMMA WGPULoadOp_Undefined _wgpu_COMMA WGPUStoreOp_Undefined _wgpu_COMMA WGPU_COLOR_INIT _wgpu_COMMA }) ### define is not number */
/* #define WGPU_RENDER_PASS_STORAGE_ATTACHMENT_INIT _wgpu_MAKE_INIT_STRUCT(WGPURenderPassStorageAttachment, { NULL _wgpu_COMMA 0 _wgpu_COMMA NULL _wgpu_COMMA WGPULoadOp_Undefined _wgpu_COMMA WGPUStoreOp_Undefined _wgpu_COMMA WGPU_COLOR_INIT _wgpu_COMMA }) ### define is not number */
/* #define WGPU_REQUEST_ADAPTER_OPTIONS_INIT _wgpu_MAKE_INIT_STRUCT(WGPURequestAdapterOptions, { NULL _wgpu_COMMA WGPUFeatureLevel_Undefined _wgpu_COMMA WGPUPowerPreference_Undefined _wgpu_COMMA WGPU_FALSE _wgpu_COMMA WGPUBackendType_Undefined _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SAMPLER_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSamplerDescriptor, { NULL _wgpu_COMMA WGPU_STRING_VIEW_INIT _wgpu_COMMA WGPUAddressMode_Undefined _wgpu_COMMA WGPUAddressMode_Undefined _wgpu_COMMA WGPUAddressMode_Undefined _wgpu_COMMA WGPUFilterMode_Undefined _wgpu_COMMA WGPUFilterMode_Undefined _wgpu_COMMA WGPUMipmapFilterMode_Undefined _wgpu_COMMA 0.f _wgpu_COMMA 32.f _wgpu_COMMA WGPUCompareFunction_Undefined _wgpu_COMMA 1 _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SHADER_MODULE_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUShaderModuleDescriptor, { NULL _wgpu_COMMA WGPU_STRING_VIEW_INIT _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SHARED_FENCE_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSharedFenceDescriptor, { NULL _wgpu_COMMA WGPU_STRING_VIEW_INIT _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SHARED_FENCE_EXPORT_INFO_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSharedFenceExportInfo, { NULL _wgpu_COMMA _wgpu_ENUM_ZERO_INIT(WGPUSharedFenceType) _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SHARED_TEXTURE_MEMORY_A_HARDWARE_BUFFER_PROPERTIES_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSharedTextureMemoryAHardwareBufferProperties, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_SharedTextureMemoryAHardwareBufferProperties _wgpu_COMMA }) _wgpu_COMMA WGPU_Y_CB_CR_VK_DESCRIPTOR_INIT _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SHARED_TEXTURE_MEMORY_BEGIN_ACCESS_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSharedTextureMemoryBeginAccessDescriptor, { NULL _wgpu_COMMA WGPU_FALSE _wgpu_COMMA WGPU_FALSE _wgpu_COMMA 0 _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SHARED_TEXTURE_MEMORY_DMA_BUF_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSharedTextureMemoryDmaBufDescriptor, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_SharedTextureMemoryDmaBufDescriptor _wgpu_COMMA }) _wgpu_COMMA WGPU_EXTENT_3D_INIT _wgpu_COMMA 0 _wgpu_COMMA 0 _wgpu_COMMA 0 _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SHARED_TEXTURE_MEMORY_METAL_END_ACCESS_STATE_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSharedTextureMemoryMetalEndAccessState, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_SharedTextureMemoryMetalEndAccessState _wgpu_COMMA }) _wgpu_COMMA WGPU_FUTURE_INIT _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SURFACE_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSurfaceDescriptor, { NULL _wgpu_COMMA WGPU_STRING_VIEW_INIT _wgpu_COMMA }) ### define is not number */
/* #define WGPU_TEXEL_COPY_BUFFER_INFO_INIT _wgpu_MAKE_INIT_STRUCT(WGPUTexelCopyBufferInfo, { WGPU_TEXEL_COPY_BUFFER_LAYOUT_INIT _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_TEXEL_COPY_TEXTURE_INFO_INIT _wgpu_MAKE_INIT_STRUCT(WGPUTexelCopyTextureInfo, { NULL _wgpu_COMMA 0 _wgpu_COMMA WGPU_ORIGIN_3D_INIT _wgpu_COMMA WGPUTextureAspect_Undefined _wgpu_COMMA }) ### define is not number */
/* #define WGPU_TEXTURE_COMPONENT_SWIZZLE_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUTextureComponentSwizzleDescriptor, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_TextureComponentSwizzleDescriptor _wgpu_COMMA }) _wgpu_COMMA WGPU_TEXTURE_COMPONENT_SWIZZLE_INIT _wgpu_COMMA }) ### define is not number */
/* #define WGPU_TEXTURE_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUTextureDescriptor, { NULL _wgpu_COMMA WGPU_STRING_VIEW_INIT _wgpu_COMMA WGPUTextureUsage_None _wgpu_COMMA WGPUTextureDimension_Undefined _wgpu_COMMA WGPU_EXTENT_3D_INIT _wgpu_COMMA WGPUTextureFormat_Undefined _wgpu_COMMA 1 _wgpu_COMMA 1 _wgpu_COMMA 0 _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_VERTEX_BUFFER_LAYOUT_INIT _wgpu_MAKE_INIT_STRUCT(WGPUVertexBufferLayout, { NULL _wgpu_COMMA WGPUVertexStepMode_Undefined _wgpu_COMMA 0 _wgpu_COMMA 0 _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_ADAPTER_INFO_INIT _wgpu_MAKE_INIT_STRUCT(WGPUAdapterInfo, { NULL _wgpu_COMMA WGPU_STRING_VIEW_INIT _wgpu_COMMA WGPU_STRING_VIEW_INIT _wgpu_COMMA WGPU_STRING_VIEW_INIT _wgpu_COMMA WGPU_STRING_VIEW_INIT _wgpu_COMMA WGPUBackendType_Undefined _wgpu_COMMA _wgpu_ENUM_ZERO_INIT(WGPUAdapterType) _wgpu_COMMA 0 _wgpu_COMMA 0 _wgpu_COMMA 0 _wgpu_COMMA 0 _wgpu_COMMA }) ### define is not number */
/* #define WGPU_BIND_GROUP_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUBindGroupDescriptor, { NULL _wgpu_COMMA WGPU_STRING_VIEW_INIT _wgpu_COMMA NULL _wgpu_COMMA 0 _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_BIND_GROUP_LAYOUT_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUBindGroupLayoutDescriptor, { NULL _wgpu_COMMA WGPU_STRING_VIEW_INIT _wgpu_COMMA 0 _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_COLOR_TARGET_STATE_INIT _wgpu_MAKE_INIT_STRUCT(WGPUColorTargetState, { NULL _wgpu_COMMA WGPUTextureFormat_Undefined _wgpu_COMMA NULL _wgpu_COMMA WGPUColorWriteMask_All _wgpu_COMMA }) ### define is not number */
/* #define WGPU_COMPILATION_INFO_INIT _wgpu_MAKE_INIT_STRUCT(WGPUCompilationInfo, { NULL _wgpu_COMMA 0 _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_COMPUTE_PIPELINE_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUComputePipelineDescriptor, { NULL _wgpu_COMMA WGPU_STRING_VIEW_INIT _wgpu_COMMA NULL _wgpu_COMMA WGPU_COMPUTE_STATE_INIT _wgpu_COMMA }) ### define is not number */
/* #define WGPU_DAWN_FORMAT_CAPABILITIES_INIT _wgpu_MAKE_INIT_STRUCT(WGPUDawnFormatCapabilities, { NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_DEVICE_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUDeviceDescriptor, { NULL _wgpu_COMMA WGPU_STRING_VIEW_INIT _wgpu_COMMA 0 _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA WGPU_QUEUE_DESCRIPTOR_INIT _wgpu_COMMA WGPU_DEVICE_LOST_CALLBACK_INFO_INIT _wgpu_COMMA WGPU_UNCAPTURED_ERROR_CALLBACK_INFO_INIT _wgpu_COMMA }) ### define is not number */
/* #define WGPU_PIPELINE_LAYOUT_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUPipelineLayoutDescriptor, { NULL _wgpu_COMMA WGPU_STRING_VIEW_INIT _wgpu_COMMA 0 _wgpu_COMMA NULL _wgpu_COMMA 0 _wgpu_COMMA }) ### define is not number */
/* #define WGPU_RENDER_PASS_PIXEL_LOCAL_STORAGE_INIT _wgpu_MAKE_INIT_STRUCT(WGPURenderPassPixelLocalStorage, { _wgpu_MAKE_INIT_STRUCT(WGPUChainedStruct, { NULL _wgpu_COMMA WGPUSType_RenderPassPixelLocalStorage _wgpu_COMMA }) _wgpu_COMMA 0 _wgpu_COMMA 0 _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SHARED_TEXTURE_MEMORY_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSharedTextureMemoryDescriptor, { NULL _wgpu_COMMA WGPU_STRING_VIEW_INIT _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SHARED_TEXTURE_MEMORY_END_ACCESS_STATE_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSharedTextureMemoryEndAccessState, { NULL _wgpu_COMMA WGPU_FALSE _wgpu_COMMA 0 _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_SHARED_TEXTURE_MEMORY_PROPERTIES_INIT _wgpu_MAKE_INIT_STRUCT(WGPUSharedTextureMemoryProperties, { NULL _wgpu_COMMA WGPUTextureUsage_None _wgpu_COMMA WGPU_EXTENT_3D_INIT _wgpu_COMMA WGPUTextureFormat_Undefined _wgpu_COMMA }) ### define is not number */
/* #define WGPU_TEXTURE_VIEW_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPUTextureViewDescriptor, { NULL _wgpu_COMMA WGPU_STRING_VIEW_INIT _wgpu_COMMA WGPUTextureFormat_Undefined _wgpu_COMMA WGPUTextureViewDimension_Undefined _wgpu_COMMA 0 _wgpu_COMMA WGPU_MIP_LEVEL_COUNT_UNDEFINED _wgpu_COMMA 0 _wgpu_COMMA WGPU_ARRAY_LAYER_COUNT_UNDEFINED _wgpu_COMMA WGPUTextureAspect_Undefined _wgpu_COMMA WGPUTextureUsage_None _wgpu_COMMA }) ### define is not number */
/* #define WGPU_VERTEX_STATE_INIT _wgpu_MAKE_INIT_STRUCT(WGPUVertexState, { NULL _wgpu_COMMA NULL _wgpu_COMMA WGPU_STRING_VIEW_INIT _wgpu_COMMA 0 _wgpu_COMMA NULL _wgpu_COMMA 0 _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_FRAGMENT_STATE_INIT _wgpu_MAKE_INIT_STRUCT(WGPUFragmentState, { NULL _wgpu_COMMA NULL _wgpu_COMMA WGPU_STRING_VIEW_INIT _wgpu_COMMA 0 _wgpu_COMMA NULL _wgpu_COMMA 0 _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_RENDER_PASS_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPURenderPassDescriptor, { NULL _wgpu_COMMA WGPU_STRING_VIEW_INIT _wgpu_COMMA 0 _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* #define WGPU_RENDER_PIPELINE_DESCRIPTOR_INIT _wgpu_MAKE_INIT_STRUCT(WGPURenderPipelineDescriptor, { NULL _wgpu_COMMA WGPU_STRING_VIEW_INIT _wgpu_COMMA NULL _wgpu_COMMA WGPU_VERTEX_STATE_INIT _wgpu_COMMA WGPU_PRIMITIVE_STATE_INIT _wgpu_COMMA NULL _wgpu_COMMA WGPU_MULTISAMPLE_STATE_INIT _wgpu_COMMA NULL _wgpu_COMMA }) ### define is not number */
/* + END <webgpu/webgpu.h> /usr/local/include/webgpu/webgpu.h */
]]
return require 'ffi.load' 'webgpu_dawn'
