
import { URL } from "url";

const urlMap = new Map<string, string>();

let counter: number = 0;

const domain: string = 'https://smolurl.com/';
/**
 * Encodes a URL to a shortened URL.
 */
function encode(longUrl: string): string {
	counter++;
    urlMap.set(counter.toString(), longUrl);
    return domain + counter.toString();
};

/**
 * Decodes a shortened URL to its original URL.
 */
function decode(shortUrl: string): string {
	const shortUrlObj = new URL(shortUrl);
    const key: string = shortUrlObj.pathname.substring(1);
    const longUrl: string | undefined = urlMap.get(key);
    if (longUrl) {
        return longUrl;
    } else {
        throw new Error("Short URL does not correspond to a known long URL");
    }
};