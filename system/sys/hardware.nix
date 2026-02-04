{ pkgs, ... }:
{
  hardware.cpu.intel.updateMicrocode = true;
  environment.systemPackages = with pkgs; [
    # bluez # 蓝牙核心工具集（如 bluetoothctl 命令行管理蓝牙）
    intel-ocl # Intel 核显 OpenCL 运行时（支持 GPU 加速计算，如视频编码、AI 推理）
    sof-firmware # Sound Open Firmware（Intel 音频 SOF 驱动固件，即使前面切 HDA 也建议保留，避免兼容问题）
  ];
  hardware.bluetooth.enable = true;
  hardware.intel-gpu-tools.enable = true;
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-compute-runtime # Intel 核显计算运行时（增强 OpenCL/Vulkan 支持，比 intel-ocl 更全面）
      intel-media-driver # Intel 核显视频硬解码驱动（支持 H.264、H.265、VP9 硬解，播放 4K 视频不卡顿）
      intel-vaapi-driver # VA-API 视频加速接口（播放器如 MPV、Chrome 需通过它调用硬解码）
      vpl-gpu-rt # Intel 视频处理库（支持新一代 AV1 编码/解码，适合 8K 视频、直播推流）
    ];
    extraPackages32 = with pkgs.pkgsi686Linux; [ intel-vaapi-driver ]; # 32 位 VA-API 驱动（兼容 32 位软件，如部分老游戏、播放器）
  };
}
