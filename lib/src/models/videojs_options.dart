import 'package:video_js_themed/src/models/source.dart';

class VideoJsOptions {
  /// Determines whether or not the player has controls that the user can interact with.
  /// Without controls the only way to start the video playing is with the autoplay attribute
  /// or through the Player API.
  final bool? controls;

  /// Causes the video to start over as soon as it ends.
  final bool? loop;

  /// Will silence any audio by default.
  final bool? muted;

  /// A URL to an image that displays before the video begins playing. This is often a frame
  /// of the video or a custom title screen. As soon as the user hits "play" the image will go away.
  final String? poster;

  /// Puts the player in fluid mode and the value is used when calculating the dynamic size of the player.
  /// The value should represent a ratio - two numbers separated by a colon (e.g. "16:9" or "4:3").
  /// Alternatively, the classes vjs-16-9, vjs-9-16, vjs-4-3 or vjs-1-1 can be added to the player.
  final String? aspectRatio;

  /// When true, the Video.js player will have a fluid size. In other words, it will scale to fit its
  /// container at the video's intrinsic aspect ratio, or at a specified aspectRatio
  final bool? fluid;

  final bool? fill;

  /// A language code matching one of the available languages in the player. This sets the initial language
  /// for a player, but it can always be changed.
  final String? language;

  /// Allows the player to use the new live ui that includes:
  final bool? liveui;

  /// Allows overriding the default message that is displayed when Video.js cannot play back a media source.
  final String? notSupportedMessage;

  /// An array of numbers strictly greater than 0, where 1 means regular speed (100%), 0.5 means half-speed (50%),
  /// 2 means double-speed (200%), etc. If specified, Video.js displays a control (of class vjs-playback-rate) allowing
  /// the user to choose playback speed from among the array of choices. The choices are presented in the specified order
  /// from bottom to top.
  final List<double>? playbackRates;

  /// Setting this to true will change fullscreen behaviour on devices which do not support the HTML5 fullscreen API
  /// but do support fullscreen on the video element, i.e. iPhone. Instead of making the video fullscreen, the player
  /// will be stretched to fill the browser window.
  final bool? preferFullWindow;

  /// Setting this option to true will cause the player to customize itself based on responsive
  /// breakpoints (see: breakpoints option).
  /// When this option is false (the default), responsive breakpoints will be ignored.
  final bool? responsive;

  /// An array of objects that mirror the native <video> element's capability to have a series of child
  /// <source> elements. This should be an array of objects with the src and type properties.
  final List<Source>? sources;

  /// If set to true, then the no compatible source error will not be triggered immediately and instead will
  /// occur on the first user interaction. This is useful for Google's "mobile friendly" test tool, which can't
  /// play video but where you might not want to see an error displayed.
  final bool? suppressNotSupportedError;

  final bool? skipButtons;
  final int? forwardDuration;
  final int? backwardDuration;

  VideoJsOptions(
      {this.controls,
      this.loop,
      this.muted,
      this.poster,
      this.aspectRatio,
      this.fluid,
      this.fill,
      this.language,
      this.liveui,
      this.notSupportedMessage,
      this.playbackRates,
      this.preferFullWindow,
      this.responsive,
      this.sources,
      this.suppressNotSupportedError,
      this.skipButtons,
      this.forwardDuration,
      this.backwardDuration});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (controls != null) data['controls'] = controls;
    if (loop != null) data['loop'] = loop;
    if (muted != null) data['muted'] = muted;
    if (poster != null) data['poster'] = '"$poster"';
    if (aspectRatio != null) {
      data['aspectRatio'] = '"$aspectRatio"';
    }
    if (language != null) data['language'] = '"$language"';
    if (liveui != null) data['liveui'] = liveui;
    if (notSupportedMessage != null) {
      data['notSupportedMessage'] = '"$notSupportedMessage"';
    }
    if (playbackRates != null) data['playbackRates'] = playbackRates;
    if (preferFullWindow != null) {
      data['preferFullWindow'] = preferFullWindow;
    }
    if (responsive != null) data['responsive'] = responsive;
    if (suppressNotSupportedError != null) {
      data['suppressNotSupportedError'] = suppressNotSupportedError;
    }
    if (sources != null) {
      data['sources'] = sources!.map((v) => v.toJson()).toList();
    }

    if (skipButtons != null) {
      data['plugins'] = {
        'seekButtons': {
          'forward': forwardDuration ?? 3,
          'back': backwardDuration ?? 3
        }
      };
    }

    if (fluid != null) data['fluid'] = fluid;

    if (fill != null) data['fill'] = fill;

    return data;
  }
}
