package com.selphi.flutter.plugin.selphi_face_plugin;

import android.graphics.Bitmap;
import android.util.Base64;
import com.facephi.fphiwidgetcore.FPhiImage;
import com.facephi.fphiwidgetcore.WidgetConfiguration;
import com.facephi.fphiwidgetcore.WidgetExceptionType;
import com.facephi.fphiwidgetcore.WidgetResult;
import org.json.JSONException;
import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class SelphiFaceOutputBundle {

    public int _finishStatus = 1;
    public int _errorDiagnostic = 2;
    public int _livenessDiagnostic = 1;
    public int _facialScoreDiagnostic = 0;

    public ArrayList<String> _base64Images = new ArrayList<String>();

    public float eyeGlassesScore = 0.0f;
    public float templateScore = 0.0f;

    public String qrData = null;
    public String _base64BestImage = null;
    public String _base64BestImageCropped = null;
    public String _bestImageTemplateRaw = null;
    public String _errorMessage = null;
    public String _base64Template = null;
    public String _base64TemplateRaw = null;
    public String _statistics = null;

    /**
     * @description Default overloaded. Process the User Control result exception.
     * @param exceptionType User Control Exception type if exists.
     */
    public SelphiFaceOutputBundle(WidgetExceptionType exceptionType) {
        switch (exceptionType) {
            case StoppedManually:
                _finishStatus = 3; // CancelByUser
                _errorDiagnostic = 2; // NoError
                _livenessDiagnostic = 1; // Not Rated
                break;
            case Timeout:
                _finishStatus = 4; // Timeout
                _errorDiagnostic = 2; // NoError
                _livenessDiagnostic = 1; // Not Rated
                break;
            case None:
                _finishStatus = 1; // Ok
                _errorDiagnostic = 2; // NoError
                _livenessDiagnostic = 1; // Not Rated
                break;
            case CameraPermissionDenied:
                _finishStatus = 2; // Error
                _errorDiagnostic = 3; // CameraPermissionDenied
                _livenessDiagnostic = 1; // Not Rated
                break;
            case SettingsPermissionDenied:
                _finishStatus = 2; // Error
                _errorDiagnostic = 4; // SettingsPermissionDenied
                _livenessDiagnostic = 1; // Not Rated
                break;
            case HardwareError:
                _finishStatus = 2; // Error
                _errorDiagnostic = 5; // HardwareError
                _livenessDiagnostic = 1; // Not Rated
                break;
            default:
                _finishStatus = 2; // Error
                _errorDiagnostic = 1; // UnknownError
                _livenessDiagnostic = 1; // Not Rated
                break;
        }
    }

    /**
     * @description Default constructor. Process the User Control result and encapsulates his values
     * @param result Control result
     * @param _enableGenerateTemplateRaw
     */
    public SelphiFaceOutputBundle(WidgetResult result, float jpgQuality, boolean _enableGenerateTemplateRaw) {
        if (result.getException() != null) {
            if (result.getException().getExceptionType() != null) {
                switch (result.getException().getExceptionType()) {
                case StoppedManually:
                    _finishStatus = 3; // CancelByUser
                    _errorDiagnostic = 2; // NoError
                    _livenessDiagnostic = 1; // Not Rated
                    return;
                case Timeout:
                    _finishStatus = 4; // Timeout
                    _errorDiagnostic = 2; // NoError
                    _livenessDiagnostic = 1; // Not Rated
                    return;
                case None:
                    _finishStatus = 1; // Ok
                    _errorDiagnostic = 2; // NoError
                    _livenessDiagnostic = 1; // Not Rated
                    break;
                case CameraPermissionDenied:
                    _finishStatus = 2; // Error
                    _errorDiagnostic = 3; // CameraPermissionDenied
                    _livenessDiagnostic = 1; // Not Rated
                    return;
                case SettingsPermissionDenied:
                    _finishStatus = 2; // Error
                    _errorDiagnostic = 4; // SettingsPermissionDenied
                    _livenessDiagnostic = 1; // Not Rated
                    return;
                case HardwareError:
                    _finishStatus = 2; // Error
                    _errorDiagnostic = 5; // HardwareError
                    _livenessDiagnostic = 1; // Not Rated
                    return;
                case ExtractionLicenseError:
                    _finishStatus = 2; // Error
                    _errorDiagnostic = 6; // ExtractionLicenseError
                    _livenessDiagnostic = 1; // Not Rated
                    return;
                case UnexpectedCaptureError:
                    _finishStatus = 2; // Error
                    _errorDiagnostic = 7; // UnexpectedCaptureError
                    _livenessDiagnostic = 1; // Not Rated
                    return;
                case ControlNotInitializedError:
                    _finishStatus = 2; // Error
                    _errorDiagnostic = 8; // ControlNotInitializedError
                    _livenessDiagnostic = 1; // Not Rated
                    return;
                case BadExtractorConfiguration:
                    _finishStatus = 2; // Error
                    _errorDiagnostic = 9; // ControlNotInitializedError
                    _livenessDiagnostic = 1; // Not Rated
                    return;
                default:
                    _finishStatus = 2; // Error
                    _errorDiagnostic = 1; // UnknownError
                    _livenessDiagnostic = 1; // Not Rated
                    return;
                }
            } else {
                _finishStatus = 2; // Error
                _errorDiagnostic = 1; // UnknownError
                _errorMessage = result.getException().getMessage();
                return;
            }
        }
        
        if(result.getLivenessDiagnostic() != null) {
            switch (result.getLivenessDiagnostic()) {
                case NotRated:
                    _livenessDiagnostic = 1;
                    break;
                case PhotoDetected:
                    _livenessDiagnostic = 2;
                    break;
                case LivenessDetected:
                    _livenessDiagnostic = 3;
                    break;
                case Unsuccess:
                    _livenessDiagnostic = 4;
                    break;
                case UnsuccessLowPerformance:
                    _livenessDiagnostic = 5;
                    break;
                case UnsuccessGlasses:
                    _livenessDiagnostic = 6;
                    break;
                case UnsuccessLight:
                    _livenessDiagnostic = 7;
                    break;
                case UnsuccessNoMovement:
                    _livenessDiagnostic = 6;
                    break;
                case UnsuccessWrongDirection:
                    _livenessDiagnostic = 7;
                    break;
                case UnsuccessTooFar:
                    _livenessDiagnostic = 6;
                    break;
                case UnsuccessPlayback:
                    _livenessDiagnostic = 7;
                    break;
            }
        }

        if(result.getTemplate() != null)
            _base64Template = Base64.encodeToString(result.getTemplate(), Base64.NO_WRAP);
        else
            _base64Template = null;

        if(result.getTemplateRaw() != null)
            _base64TemplateRaw = Base64.encodeToString(result.getTemplateRaw(), Base64.NO_WRAP);
        else
            _base64TemplateRaw = null;

        List<FPhiImage> fphiImages = result.getImages();

        if(fphiImages == null || fphiImages.size() == 0) {
            _base64Images = null;
        }
        else {
            for(int im = 0; im < 1; im++) {
                String base64Image = processPicture(fphiImages.get(im).getImage(), jpgQuality);
                _base64Images.add(base64Image);
            }
        }

        if(result.getBestImage() != null) {
            _base64BestImage = processPicture(result.getBestImage().getImage(), jpgQuality);

            if (_enableGenerateTemplateRaw) {
                Bitmap bmpImage = SelphiFaceImageUtils.toBitmap((String) _base64BestImage);
                byte[] bmpTemplate = WidgetConfiguration.generateTemplateRawFromBitmap(bmpImage);
                _bestImageTemplateRaw = SelphiFaceImageUtils.toBase64(bmpTemplate);
            }
        }

        if(result.getBestImageCropped() != null) {
            _base64BestImageCropped = processPicture(result.getBestImageCropped().getImage(), jpgQuality);
        }

        if(result.getTemplateInfo() != null) {
            eyeGlassesScore = result.getTemplateInfo().getEyeGlassesScore();
            templateScore = result.getTemplateInfo().getTemplateScore();
        }

        if(result.getQRData() != null)
            qrData = result.getQRData();

        if(result.getFacialScoreDiagnostic() >= 0)
            _facialScoreDiagnostic = result.getFacialScoreDiagnostic();

        if(result.getStatistics() != null)
            _statistics = result.getStatistics();
    }

    /**
     * @description Sets the results message.
     *
     * @param errorMessage The error message.
     */
    public void setResultMessage(String errorMessage) {
        _errorMessage = errorMessage;
    }

    public HashMap<String, Object> ReturnOutputJSON() throws JSONException {
        HashMap<String, Object> result = new HashMap<>();
        ArrayList images;
        if(_base64Images == null || _base64Images.size() == 0)
            images = null;
        else {
            images = new ArrayList();
            int tam = _base64Images.size();
            if(tam > 1) tam = 1; // FOR TESTING
            for(int p = 0; p < tam; p++) {
                images.add(_base64Images.get(p));
            }
        }

        result.put("finishStatus", _finishStatus);
        result.put("template", _base64Template);
        result.put("images", images);
        result.put("livenessDiagnostic", _livenessDiagnostic);
        result.put("errorType", ""+_errorDiagnostic);
        result.put("errorMessage", _errorMessage);
        result.put("templateRaw",  _base64TemplateRaw);
        result.put("eyeGlassesScore",eyeGlassesScore);
        result.put("templateScore",templateScore);
        result.put("bestImage", _base64BestImage);
        result.put("bestImageCropped", _base64BestImageCropped);
        if (_statistics != null)
            result.put("statistics", _statistics);
        result.put("faceScoreDiagnostic", _facialScoreDiagnostic);

        if (qrData != null)
            result.put("qrData", qrData);

        if (_bestImageTemplateRaw != null)
            result.put("bestImageTemplateRaw", _bestImageTemplateRaw);

        return result;
    }

    /**
     * @description Compress bitmap using jpeg, convert to Base64 encoded string, and return to JavaScript.
     *
     * @param bitmap
     */
    private String processPicture(Bitmap bitmap, float jpgQuality) {
        if(bitmap == null)
            return null;

        ByteArrayOutputStream jpeg_data = new ByteArrayOutputStream();
        Bitmap.CompressFormat compressFormat = Bitmap.CompressFormat.JPEG;

        try {
            if (bitmap.compress(compressFormat, (int)Math.ceil(jpgQuality * 100), jpeg_data)) {
                byte[] code = jpeg_data.toByteArray();
                byte[] output = Base64.encode(code, Base64.NO_WRAP);
                String js_out = new String(output);
                return js_out;
            }
        } catch (Exception e) {
        }
        return null;
    }
}